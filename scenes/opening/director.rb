module Opening
  class Director
    def initialize
     # @bg_img = Image.load('image/op-image.png')
     @font = Font.new(32)
    end

    def play
            Window.draw(10,10,Image.new(10,10,C_WHITE))
            Window.draw_font(340, 300, 'Push Space key to restart',@font, color: C_RED)
            scene_transition
    end

    def scene_transition
      Scene.move_to(:game) if Input.key_push?(K_SPACE)
    end
  end
end
