class CPBall < CPBase
        attr_accessor :body,:shape

        def initialize(x,y,r,image)
                @body=CP::Body.new(1,CP::INFINITY)
                @body.p = CP::Vec2.new(x,y)
                @shape=CP::Shape::Circle.new(@body,r,CP::Vec2.new(0,0))
                @image=image || Image.new(r*2,r*2).circle_fill(r,r,r,C_WHITE)
                @r=r
        end

        def draw
                Window.draw(@body.p.x-@r,@body.p.y-@r-@r*0.8,@image)
        end
end
