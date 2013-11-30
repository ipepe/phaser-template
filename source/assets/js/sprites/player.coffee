class PlayerSprite extends Phaser.Sprite
  constructor: ->
    super
    @body.bounce.y = 0.2
    @body.collideWorldBounds = true
    @body.gravity.y = 6
    @body.setSize(16, 32, 8, 16)

    @animations.add('left', [0, 1, 2, 3], 10, true)
    @animations.add('right', [5, 6, 7, 8], 10, true)

    @jumpTimer = 0
    @inputs =
      cursors: @game.input.keyboard.createCursorKeys()
      jump: @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)

    @game.add.existing(@)

  move: ->
    @body.velocity.x = 0

    if @inputs.cursors.left.isDown
      @body.velocity.x = -150
      @animations.play 'left'
    else if @inputs.cursors.right.isDown
      @body.velocity.x = 150
      @animations.play 'right'
    else
      if @animations.currentAnim.name == 'left'
        @frame = 0
      else
        @frame = 5
      @animations.stop()

    if @inputs.jump.isDown && @body.touching.down && @game.time.now > @jumpTimer
      @body.velocity.y = -250
      @jumpTimer = @game.time.now + 750
