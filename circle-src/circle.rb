require 'chipmunk'
require 'dxruby'

#ボールの動き


class CPCircle
  attr_accessor :body, :shape

  def initialize(x, y, r, mass)
    # monent
    moment = CP::moment_for_circle(mass, 0, r, CP::Vec2.new(0, 0))
    @body = CP::Body.new(mass, moment)
    @body.p = CP::Vec2.new(x + r, y + r)

    # circle
    @shape = CP::Shape::Circle.new(@body, r, CP::Vec2.new(0, 0))

    # image
    @image = Image.new(r * 2, r * 2).circle_fill(r, r, r,C_WHITE).line(0, r, r, r, C_BLACK)
    @r = r
  end

  def draw
    Window.draw_rot(@body.p.x - @r, @body.p.y - @r, @image, @body.a * 180.0 / Math::PI)
  end
end

class CPStaticBox
  attr_accessor :body, :shape

  def initialize(x1, y1, x2, y2)
    @body = nil

    # shape
    verts = [CP::Vec2.new(x1, y1), CP::Vec2.new(x1, y2), CP::Vec2.new(x2, y2), CP::Vec2.new(x2, y1)]
    @shape = CP::Shape::Poly.new(CP::Space::STATIC_BODY, verts, CP::Vec2.new(0, 0))

    # img
    @image = Image.new(x2 - x1 + 1, y2 - y1 + 1, C_WHITE)

    @x, @y = x1, y1
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end

class CP::Space

  STATIC_BODY = CP::Body.new_static
  STATIC_BODY.p = CP::Vec2.new(0, 0)

  def add(s)
    self.add_body(s.body) if s.body
    self.add_shape(s.shape)
  end
end
