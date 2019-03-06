module GameOver
  class Director
    def initialize
      #@bg_img = Image.load('ending_bg.png')
      @font = Font.new(32)
      @bg_img = Image.new(100, 100, C_WHITE)
    end

    def play
      Window.draw(0, 0, @bg_img)
      Window.draw_font(340, 300, 'Push Space key to restart',@font, color: C_RED)
      scene_transition
    end

    def scene_transition
      Scene.move_to(:opening) if Input.key_push?(K_SPACE)
  end
end
end
