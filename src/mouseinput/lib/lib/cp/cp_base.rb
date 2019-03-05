class CP::Space
  STATIC_BODY = CP::Body.new_static
  STATIC_BODY.p = CP::Vec2.new(0, 0)

  def add(s)
    self.add_body(s.body) if s.body
    self.add_shape(s.shape)
  end

  def remove(s)
    self.remove_body(s.body) if s.body
    self.remove_shape(s.shape)
  end
end

class CPBase
  def self.generate_walls(space, width = 800, height = 600, wall_width = 20)
    walls = []
    walls << CPStaticBox.new(0, height, width, height + wall_width)
    walls << CPStaticBox.new(-wall_width, 0, 0, height)
    walls << CPStaticBox.new(0, -wall_width, width, 0)
    walls << CPStaticBox.new(width, 0, width + wall_width, height)
    walls.each do |wall|
      space.add(wall)
    end
    walls
  end

  def apply_force(x, y)
    body.apply_impulse(CP::Vec2.new(x, y), CP::Vec2.new(0, 0))
  end

  def set_eu(e, u)
    shape.e = e
    shape.u = u
  end
end