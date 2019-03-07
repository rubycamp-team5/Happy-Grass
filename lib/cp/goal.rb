class Goal
    attr_accessor :goal
    #GOAL_IMG=Image.load("")

    #ball ‚ªgoal‚É‚«‚½‚çtrue‚ð‚©‚¦‚·
    def judgement(body)
            @center_x=@x+@img.width/2
            @center_y=@y+@img.height/2+50
            #return 0 unless body
            if((@x-@margin)..(@x+@margin)).include?(body.p.x.to_i)&&((@y-@margin)..(@y+@margin)).include?(body.p.y.to_i)
                    return 1
            else
                    return 0
            end
    end

    def draw
            Window.draw(@x,@y,@img)
    end
end
