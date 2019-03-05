require "dxruby"
require "chipmunk"
require_relative "lib/lib/cp/"
line=[]

space=CP::Space.new
space.gravity=CP::Vec2.new(0,100)
body = CP::Body.new(1,CP::INFINITY)
body.p=CP::Vec2.new(100,100)
shape=CP::Shape::Circle.new(body,40,CP::Vec2.new(0,0))
space.add_body(body)
space.add_shape(shape)
image = Image.load("img/ball-g.png",20,20)
obj=[]
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
                        bl=CPStaticBox.new(x1,y1,x2,y2)
                        space.add(bl)
                        obj << bl
                end
        end
        for o in obj do
                        o.draw
        end
        space.step(1.0/60.0)
        Window.draw(body.p.x-10, body.p.y+5, image)
end
