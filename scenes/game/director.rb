module Game
	class Director
		def initialize
            @line=[]
			@obj = []
			@space = CP::Space.new
			@space.gravity=CP::Vec2.new(0,100)
            @image=nil
			#@image = Image.load("lib/img/ball-g.png",20,20)
            @ball = CPBall.new(100,0,10,@image)
            @space.add(@ball)
            @goal=GoalBox.new(600,400,10,nil)
			
		end

		def play
                if Input.mouse_down?(M_LBUTTON)
                        x=Input.mouse_pos_x
                        y=Input.mouse_pos_y
                        @line<<[x,y]
                        if @line.size()-2>0
                                l = @line.size()-1
                                pos1=@line[l]
                                pos2=@line[l-1]
                                cand_x = [pos1[0],pos2[0]]
                                cand_y = [pos1[1],pos2[1]]
                                x1=cand_x.min
                                x2=cand_x.max
                                y1=cand_y.min
                                y2=cand_y.max

                                bl = CPStaticBox.new(x1,y1,x2,y2,color=C_RED)
                                @space.add(bl)
                                @obj << bl
                        end
                else
                        @line.clear
                end

                for o in @obj do
                    o.draw
                end
                @space.step(1.0/60.0)
                game_over()
                @ball.draw()
                @goal.draw()
                if @goal.judgement(@ball)==1
                        print("goal")
                        scene_transition
                end
            end

		def game_over
              if @ball.body.p.y >= 500
	   			scene_transition
			end
		end

		def scene_transition
			Scene.move_to(:ending) #unless @current
		end
	end
end
