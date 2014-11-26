window.onload = ->
  # Game (Full Screen by Default)
  @game = new Phaser.Game(window.innerWidth, window.innerHeight, Phaser.AUTO)

  # Additional Attributes
  @game.title = 'Phaser Template'

  # States
  @game.state.add 'main', new MainState
  @game.state.add 'loading', new LoadingState, true
