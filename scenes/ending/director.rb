module Ending
  class Director
    def initialize
      @font = Font.new(32)
      @bg_img = Image.new(100, 100, C_WHITE)
    end

    def play
      Window.draw(0, 0, @bg_img)
      scene_transition
    end

    def scene_transition
      Scene.move_to(:opening) if Input.key_push?(K_SPACE)
    end
  end
end
