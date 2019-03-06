require 'dxruby'
require_relative 'lib/cp/'
require_relative 'lib/'

Window.width=1024
Window.height=768

Scane,add(Openig::Director.new,:opening)

Scene.move_to :opening

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.play
end
