module Success
  class Director
    def initialize
      #@bg_img = Image.load('ending_bg.png')
      @font = Font.new(32)
      @bg_img = Image.new(100, 100, C_WHITE)
    end

    def play
      #Window.draw(0, 0, @bg_img)
      #Window.draw_font(400,300,'Success!',@font,color:C_RED)
      bgimage_draw
      scene_transition
    end

    def bgimage_draw
	bg = Image.load("lib/img/SUCCESS.png")
	Window.draw(0, 0, bg)
    end

    def scene_transition
            if Input.key_push?(K_SPACE)
                Scene.move_to(:opening) 
                Scene.start()
            end
  end
end
end
