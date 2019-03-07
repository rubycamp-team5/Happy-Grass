
module Game
	class Director3
		def initialize
            #@sound=Sound.new("./lib/music/fail.wav")
			@r = 15
			@obj = []
			@space = CP::Space.new
			@space.gravity=CP::Vec2.new(0,100)
			@body = CP::Body.new(1,CP::INFINITY)
			@body.p=CP::Vec2.new(100,40)
			@shape=CP::Shape::Circle.new(@body,@r,CP::Vec2.new(0,0))
			@space.add_body(@body)
			@space.add_shape(@shape)
			@image = Image.new(@r*2, @r*2).circle_fill(@r, @r, @r, C_RED)#Image.load("lib/img/ball-g.png",20,20)
			get_mouse_pos
			@current_Point = [@x, @y]
            @goal = GoalBox.new(500, 400, 10, Image.load("lib/img/a.png"))
			@time = 0
@bg = Image.load("lib/img/bg-game.png")
            @gameoverLine=500
            ####game floor obj###
            @floor1 = CPStaticSlope.new(80,100,200,400)
            @space.add(@floor1)
            @floor2 = CPStaticSlope.new(300,270,400,370,-50)
            @space.add(@floor2)
            @floor3=CPStaticSlope.new(410,220,500,320,50)
            @space.add(@floor3)
            @floor4 = CPStaticBox.new(605,370,880,400)
            @space.add(@floor4)


			@remain = 10
			@limit = 20
		end

		def play
			bgimage_draw
            gauge_draw
			#debug
			@mem_Point = [@x, @y]
			get_mouse_pos

       			draw_string if Input.mouse_down?(M_LBUTTON)

			draw_objects

        			Window.draw(@body.p.x-@r, @body.p.y-@r, @image)
			@space.step(1/60.0)

			#p @obj.size
			del_line

			game_over
            game_success
			@goal.draw()
            @floor1.draw()
            @floor2.draw()
            @floor3.draw()
            @floor4.draw()

		end

		def draw_string
			@current_Point = [@x, @y]
			count = 0
			#debug
			until (@mem_Point[0] - @current_Point[0]).abs < 2 && (@mem_Point[1] - @current_Point[1]).abs < 2
				@current_Point[0] = @current_Point[0] + ((@current_Point[0] > @mem_Point[0]) ? -1 : 1)
				@current_Point[1] = @current_Point[1] + ((@current_Point[1] > @mem_Point[1]) ? -1 : 1)
				count = count + 1
				if (count%10 == 0) && (@obj.size < @limit) then
					add_objects
					count = 0
				end
			end
		end

		def del_line
			if !(@obj.empty?) then
				#puts " ", "time", @time
				@time = @time + 1

				@obj.shift if @time >= 100
			else
				@time = 0
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
			if @body.p.y >= Window.height
                #@sound.play()
		    	Scene.move_to(:gameover) #unless @current
            end
		end

        def game_success
                Scene.move_to(:success) if @goal.judgement(@body) == 1

        end
		def scene_transition
			Scene.move_to(:gameover) #unless @current
		end
				def bgimage_draw
			Window.draw(0, 0,@bg)
		end
		def gauge_draw
			@remain = 100 - @obj.size*(100/@limit)
			pos1 = [Window.width - 150, 10]
			pos2 = [Window.width - 150 + @remain, 30]
			Window.drawBoxFill(pos1[0], pos1[1], pos2[0], pos2[1], [63, 255, 0, 0])
			Window.drawBoxFill(Window.width - 160, 5, Window.width - 150 + 120, 35, [30, 0, 255, 0])

		end
	end
end
