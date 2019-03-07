class GoalBox < Goal
        def initialize(x,y,size,img=nil)
                @x,@y=x,y
                @img= img||Image.new(size,size).fill(C_BLUE)
                @target_class_name='CPBall'
        end
end

