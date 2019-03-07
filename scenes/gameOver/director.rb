module GameOver
  class Director
    def initialize
      @font = Font.new(32)
      @bg_img = Image.new(100, 100, C_WHITE)
    end

    def play
      bgimage_draw
      scene_transition
    end

    def bgimage_draw
    	bg = Image.load("lib/img/FAIL.png")
	Window.draw(0, 0, bg)
     end

    def scene_transition
            if Input.key_push?(K_SPACE) 
                Scene.reset_scene()
                Scene.move_to(:selection)
            end
            if Input.key_push?(K_R)
                    Scene.reset_scene()
                    Scene.move_to_latest()
            end

  end
end
end
