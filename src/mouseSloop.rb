require "dxruby"
require "chipmunk"
require_relative "lib/lib/cp/"

#line=[,]

space=CP::Space.new
space.gravity=CP::Vec2.new(0,100/2)
body = CP::Body.new(1,CP::INFINITY)
body.p=CP::Vec2.new(100,100)
shape=CP::Shape::Circle.new(body,40,CP::Vec2.new(0,0))
space.add_body(body)
space.add_shape(shape)
image = Image.load("img/ball-g.png",20,20)

obj=[]
count = 0

x=Input.mouse_pos_x
y=Input.mouse_pos_y
current_Point = [x, y]

Window.loop do
	p Window.real_fps
	mem_Point = [x, y]

	x=Input.mouse_pos_x
        	y=Input.mouse_pos_y

	if Input.mouse_down?(M_LBUTTON)
		current_Point = [x, y]
		count = 0
		until (mem_Point[0] - current_Point[0]).abs < 2 && (mem_Point[1] - current_Point[1]).abs < 2
			current_Point[0] = current_Point[0] + ((current_Point[0] > mem_Point[0]) ? -1 : 1)
			current_Point[1] = current_Point[1] + ((current_Point[1] > mem_Point[1]) ? -1 : 1)
			count = count + 1
			if count%5 == 0 then
				bl = CPCircle.new(current_Point[0], current_Point[1], 5, 10, )
				obj << bl
				space.add(bl)
				count = 0
			end
		end
	end

	

	for o in obj
		o.draw
	end
	
        space.step(1.0/60.0)
        Window.draw(body.p.x-10, body.p.y+4, image)
	if body.p.y >= 400
	   break
	end
end
