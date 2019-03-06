class CPCircle < CPBase
  attr_accessor :body, :shape

  def initialize(x, y, r, mass, color, image = nil, e = 0.8, u = 0.8)
    @body = nil
    moment = CP::moment_for_circle(mass, 0, r, CP::Vec2.new(0, 0))
    @body = CP::Body.new(mass, moment)
    @body.p = CP::Vec2.new(x + r, y + r)
    @shape = CP::Shape::Circle.new(@body, r, CP::Vec2.new(0, 0))
    @image = image || Image.new(r * 2, r * 2).circle_fill(r, r, r,color)
    @r = r
    @x, @y = x, y
    shape.e = e
    shape.u = u
  end

  def move
  end

  def draw
    Window.draw(@x - @r, @y - @r, @image)
  end
end
