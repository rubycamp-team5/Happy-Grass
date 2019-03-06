require 'dxruby'
require 'chipmunk'
require_relative 'scene'
require_relative 'scenes/opening/director'
require_relative 'scenes/ending/director'
require_relative 'scenes/game/director'
#require_relative 'src/image'

Window.width=1024
Window.height=768

Scene.add(Opening::Director.new, :opening)
Scene.add(Game::Director.new, :game)
Scene.add(Ending::Director.new, :ending)

Scene.move_to :opening

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.play
end
