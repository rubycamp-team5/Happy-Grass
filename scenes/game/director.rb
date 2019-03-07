module Game
	class Director
		def initialize
			@obj = []
			@space = CP::Space.new
			@space.gravity=CP::Vec2.new(0,100)
			@body = CP::Body.new(1,CP::INFINITY)
			@body.p=CP::Vec2.new(100,10)
			@shape=CP::Shape::Circle.new(@body,40,CP::Vec2.new(0,0))
			@space.add_body(@body)
			@space.add_shape(@shape)
			@image = Image.load("lib/img/ball-g.png",20,20)
			get_mouse_pos
			@current_Point = [@x, @y]
            @goal = GoalBox.new(600, 400, 10, Image.load("lib/img/a.png"))
			@time = 0

			@bg = Image.load("lib/img/bg-game.png")
            ####game floor obj###
            @floor1 = CPStaticSlope.new(80,100,140,130,50)
            @space.add(@floor1)

		end

		def play
			p Window.real_fps

			bgimage_draw

			#debug
			@mem_Point = [@x, @y]
			get_mouse_pos

       			draw_string if Input.mouse_down?(M_LBUTTON)

			draw_objects

        			Window.draw(@body.p.x-10, @body.p.y+4, @image)
			@space.step(1/60.0)

			del_line

			game_over
            game_success
			@goal.draw()
            @floor1.draw()
		end

		def bgimage_draw
			Window.draw(0, 0,@bg)
		end

		def draw_string
			@current_Point = [@x, @y]
			count = 0
			#debug
			until (@mem_Point[0] - @current_Point[0]).abs < 2 && (@mem_Point[1] - @current_Point[1]).abs < 2
				@current_Point[0] = @current_Point[0] + ((@current_Point[0] > @mem_Point[0]) ? -1 : 1)
				@current_Point[1] = @current_Point[1] + ((@current_Point[1] > @mem_Point[1]) ? -1 : 1)
				count = count + 1
				if (count%10 == 0) && (@obj.size < 100) then
					add_objects
					count = 0
				end
			end
		end

		def del_line
			if !(@obj.empty?) then
				if @time%100 == 0 then
					@obj.shift
					@time = 0
				else
					@time = 0
				end
			end
		end

		def debug(mem = @mem_Point, current = @current_Point)
			print mem, current, "\n"
		end

		def get_mouse_pos
			@x=Input.mouse_pos_x
			@y=Input.mouse_pos_y
		end

		def draw_objects
			for o in @obj
				o.draw
			end
		end

		def add_objects
			bl = CPString.new(@current_Point[0], @current_Point[1], 5, 10, [255, rand(126 .. 256), rand(126 .. 256), rand(126 .. 256)])
			@obj << bl
			@space.add(bl)
		end

		def game_over
			if @body.p.y >= 500
		    	Scene.move_to(:gameover) #unless @current
            end
		end

        def game_success
                Scene.move_to(:success) if @goal.judgement(@body) == 1

        end
		def scene_transition
			Scene.move_to(:gameover) #unless @current
		end
	end
end
