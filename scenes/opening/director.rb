module Opening
  class Director
    def initialize
      @bg_img = Image.load('image/op-image.png')
    end

    def play
        Window.draw(0,0,@bp_image)      
      scene_transition
    end

    private

    def scene_transition
      Scene.move_to(:game) if Input.key_push?(K_SPACE)
    end
  end
end
