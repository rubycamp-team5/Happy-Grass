module Seleciton
	class Director
		def initialize
			@switch = Array.new
		end

		def play
			bgimage_draw

			case Input.keys
			when [2] then
				Scene.move_to(:game)
			when [3] then
				Scene.move_to(:game2)
			when [4] then
				Scene.move_to(:game3)
			end
		end

		def get_mouse_pos
			print Input.mousePosX, " ", Input.mousePosY, "\n"
		end

		def bgimage_draw
			bgimage = Image.load("lib/img/MAPSELECT.001.png")
			Window.draw(0, 0, bgimage)
		end

		def setting_pos
			i = 0
			3.time{
				i = i +1
				@pos[i] = window_relative(50, 25*i)
			}
		end

		def window_relative(x, y)
			w_pos = Array.new
			w_pos[0] = (x*window.width)/100
			w_pos[1] = (y*window.height)/100
			return w_pos
		end

		def mouse_input
			i = 0
			3.time{
				return i if Input.mouse_down?(M_LBUTTON) && mouse_on_image(i)
				i = i+1
			}
		end

		def mouse_on_image(i)
			return (@image[i, 0] - Input.mousePosX).abs < @image[i].width && (@image[i, 1] - Input.mousePosY).abs < @image[i].height
		end
	end
end
