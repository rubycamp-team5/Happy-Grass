module Opening
  class Director
    def initialize
     @font = Font.new(32)
    end

    def play
            #Window.draw(10,10,Image.new(10,10,C_WHITE))
            #Window.draw_font(340, 300, 'Push Space key to restart',@font, color: C_RED)
            bgimage_draw
            scene_transition
    end

    def bgimage_draw
	bg = Image.load("lib/img/op-image.png")
	Window.draw(0, 0, bg)
    end

    def scene_transition
      Scene.move_to(:selection) if Input.key_push?(K_SPACE)
    end
  end
end
