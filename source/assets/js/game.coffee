window.onload = ->
  @game = new Phaser.Game(@width, @height, Phaser.CANVAS)
  @game.state.add 'main', new MainState, true
