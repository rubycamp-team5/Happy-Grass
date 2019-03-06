module Game
	class Director
		def initialize
            print("game initializen")
            @line=[]
			@obj = []
			@space = CP::Space.new
			@space.gravity=CP::Vec2.new(0,100)

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
