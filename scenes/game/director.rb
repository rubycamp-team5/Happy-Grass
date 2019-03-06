module Game
	class Director
		def initialize
			@obj = []
			@count = 0
			@space = CP::Space.new
			@space.gravity=CP::Vec2.new(0,100/2)
			@body = CP::Body.new(1,CP::INFINITY)
			@body.p=CP::Vec2.new(100,100)
			@shape=CP::Shape::Circle.new(body,40,CP::Vec2.new(0,0))
			@space.add_body(body)
			@space.add_shape(shape)
			@image = Image.load("img/ball-g.png",20,20)
		end

		def play
			get_mouse_pos
			@mem_Point = [@x, @y]

       			 if Input.mouse_down?(M_LBUTTON)
				draw_string
			end

			draw_objects

        			Window.draw(@body.p.x-10, @body.p.y+4, @image)

		end

		def draw_string
			@current_Point = [@x, @y]
			count = 0
			until (@mem_Point[0] - @current_Point[0]).abs < 2 && (@mem_Point[1] - @current_Point[1]).abs < 2
				@current_Point[0] = @current_Point[0] + ((@current_Point[0] > @mem_Point[0]) ? -1 : 1)
				@current_Point[1] = @current_Point[1] + ((@current_Point[1] > @mem_Point[1]) ? -1 : 1)
				count = count + 1
				if count%5 == 0 then
					add_objects
					count = 0
				end
			end
		end

		def get_mouse_pos
			@x=Input.mouse_pos_x
			@y=Input.mouse_pos_y
		end


		def create_ball

		end

		def draw_objects
			for o in @obj
				o.draw
			end
		end

		def add_object
			bl = CPCircle.new(@current_Point[0], @current_Point[1], 5, 10, )
			@obj << bl
			space.add(bl)
		end

		def game_over
			if @body.p.y >= 400
	   			scene_transition
			end
		end

		def scene_transition
			Scene.move_to(:ending) #unless @current
		end
	end
end
