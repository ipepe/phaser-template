class LoadingState extends Phaser.State
  constructor: -> super

  preload: ->
    # Load Global Assets
    @game.load.image('logo', 'assets/images/logo.png')

  create: ->
    # Set Title
    document && document.title = @game.title

    # Load Main State
    @game.state.start('main')
