module Opening
  class Director
    #def initialize
     # @bg_img = Image.load('image/op-image.png')
    #end

    def play
            Window.draw(10,10,Image.new(10,10,C_WHITE))
      scene_transition
    end

    private

    def scene_transition
            Scene.move_to(:ending) if Input.key_push?(K_SPACE)
    end
  end
end
