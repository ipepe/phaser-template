class MainState extends Phaser.State
  constructor: -> super

  preload: ->
    @game.load.tilemap('level1', 'assets/maps/level1.json', null, Phaser.Tilemap.TILED_JSON)
    @game.load.tileset('tiles', 'assets/images/tiles.png', 16, 16)
    @game.load.spritesheet('dude', 'assets/images/dude.png', 32, 48)
    @game.load.image('background', 'assets/images/background.png')

  create: ->
    @loadLevel('level1')
    @player = new PlayerSprite(@game, 32, 32, 'dude')
    @game.camera.follow(@player)

  update: ->
    @game.physics.collide(@player, @collisionLayer)

  loadLevel: (key) ->
    @game.stage.backgroundColor = '#000000'
    bg = @game.add.tileSprite(0, 0, 800, 600, 'background')
    bg.fixedToCamera = true

    map = @game.add.tilemap(key)
    tileset = @game.add.tileset('tiles')
    tileset.setCollisionRange(0, tileset.total - 1, true, true, true, true)
    tileset.setCollisionRange(12, 16, false, false, false, false)
    tileset.setCollisionRange(46, 50, false, false, false, false)

    @collisionLayer = @game.add.tilemapLayer(0, 0, 800, 600, tileset, map, 0)
    @collisionLayer.resizeWorld()
