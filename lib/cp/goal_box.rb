class GoalBox < Goal
        def initialize(x,y,size,img)
                @x,@y=x,y
                @img= img||Image.load('a.png') 
                @margin=10

        end
end

