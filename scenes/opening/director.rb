module Opening
  class Director
    def initialize
            @font = Font.new(32)
    end

    def play
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
