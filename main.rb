require 'dxruby'
require 'chipmunk'
require_relative 'lib/cp'
require_relative 'scene'
require_relative 'scenes/opening/director'
require_relative 'scenes/gameover/director'
require_relative 'scenes/game/director'
require_relative 'scenes/selection/director'
require_relative 'scenes/success/director'
require_relative 'scenes/game/director2'
require_relative 'scenes/game/director3'
#require_relative 'src/image'

Window.width=900
Window.height=650
Window.load_icon("lib/img/icon.ico")
Window.caption = "Happy Grass"

Scene.add(Opening::Director, :opening)
Scene.add(Seleciton::Director, :selection)
Scene.add(Game::Director, :game)
Scene.add(Game::Director2, :game2)
Scene.add(Game::Director3, :game3)
Scene.add(GameOver::Director, :gameover)
Scene.add(Success::Director,:success)

Scene.register_first_scene(:opening)

Scene.start()
Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.play

end
