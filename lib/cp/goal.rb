class Goal
    attr_accessor :goal
    #GOAL_IMG=Image.load("")

    #ball ‚ªgoal‚É‚«‚½‚çtrue‚ð‚©‚¦‚·
    def judgement(body)
            @center_x=@x+@img.width
            @center_y=@y+@img.height
            @x_margin=100
            @y_margin=0
            #return 0 unless body
            if((@x-@x_margin)..(@center_x+@x_margin)).include?(body.p.x.to_i)&&((@y-@y_margin)..(@center_y+@y_margin)).include?(body.p.y.to_i)
                    return 1
            else
                    return 0
            end
    end

    def draw
            Window.draw(@x,@y,@img)
    end
end
