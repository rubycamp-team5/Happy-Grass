class Goal
    attr_accessor :goal
    #GOAL_IMG=Image.load("")

    #ball がgoalにきたらtrueをかえす
    def judgement(body)
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
