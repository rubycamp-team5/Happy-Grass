require "dxruby"
require "chipmunk"
require_relative "lib/lib/cp/"
line=[]

space=CP::Space.new
space.gravity=CP::Vec2.new(0,500)
#ball
image = Image.load("img/ball-g.png",20,20)
#goalImg=Image.load("./goal2.png",20,20)
goalImg=nil
ball=CPBall.new(100,0,10,image)
space.add(ball)

#mouseInputtedLines
obj=[]

#slope1=CPStaticSlope.new(80,50,200,150,down=100,color=C_BLUE)
#slope2=CPStaticSlope.new(280,250,400,350,-50,color=C_GREEN)
#space.add(slope1)
#space.add(slope2)

goal=GoalBox.new(500,400,20,goalImg)

Window.loop do
        if Input.mouse_down?(M_LBUTTON)
                x=Input.mouse_pos_x
                y=Input.mouse_pos_y
                line << [x,y]
                if line.size()-2>0
                        l=line.size()-1
                        pos1=line[l]
                        pos2=line[l-1]
                        x1 = [pos1[0],pos2[0]].min
                        x2 = [pos1[0],pos2[0]].max
                        y1 = [pos1[1],pos2[1]].min
                        y2 = [pos1[1],pos2[1]].max
                        bl=CPStaticBox.new(x1,y1,x2,y2,color=C_RED)
                        space.add(bl)
                        obj << bl
                end
        else
                line.clear
        end
        
        for o in obj do
                        o.draw
        end
        space.step(1.0/60.0)
        goal.draw()
        #slope1.draw()
        #slope2.draw()
        ball.draw()
        if goal.judgement(ball)==1
                        print("gooal")
                        break
        end
end
