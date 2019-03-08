class CPString < CPBase
  COLLISION_TYPE = 10
  attr_accessor :body, :shape

  def initialize(x, y, r, mass, color, image = nil, e = 0.8, u = 0.8)
    moment = CP::moment_for_circle(mass, 0, r, CP::Vec2.new(0, 0))
    @body = CP::Body.new(mass, moment)
    @body.p = CP::Vec2.new(x + r, y + r)
    @shape = CP::Shape::Circle.new(@body, r, CP::Vec2.new(0, 0))
    @shape.parent_obj = self
    @image = image || Image.new(r * 2, r * 2).circle_fill(r, r, r,color)
    @shape.collision_type = self.class::COLLISION_TYPE
    @r = r
    @x, @y = x, y
    shape.e = e
    shape.u = u
  end

  def move
  end

  def draw
    apply_force(@x-@body.p.x, @y-@body.p.y)
    Window.draw_rot(@body.p.x - @r, @body.p.y - @r, @image, @body.a * 180.0 / Math::PI)
  end
end
