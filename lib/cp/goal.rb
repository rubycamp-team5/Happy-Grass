class Goal
    attr_accessor :goal
    #GOAL_IMG=Image.load("")
    GOAL_IMG=Image.new(10,10,C_WHITE)

    #ball ‚ªgoal‚É‚«‚½‚çtrue‚ð‚©‚¦‚·
    def judgement(current)
            #return 0 unless current
            if((@x-@margin)..(@x+@margin)).include?(current.body.p.x.to_i)&&((@y-@margin)..(@y+@margin)).include?(current.body.p.y.to_i)
                    return 1
            else
                    return 0
            end
    end

    def draw
            Window.draw(@x,@y,@img)
    end
end
