class Goal
    attr_accessor :goal
    def judgement(body)
            range_x, range_y = 120, 50
            if ((@x + @img.width/2 -range_x)..(@x + @img.width/2 +range_x)).include?(body.p.x.to_i) && ((@y + @img.height/2 -range_y)..(@y + @img.height/2 +range_y)).include?(body.p.y.to_i)   
                    return 1
            else
                    return 0
            end
    end

    def draw
            Window.draw(@x,@y,@img)
    end
end
