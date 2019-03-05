# 静的BOX
# 重力の影響を受けない矩形オブジェクト
class CPStaticSlope < CPBase
  attr_accessor :body, :shape

  def initialize(x1, y1, x2, y2, down = 100, image = nil, e = 0.8, u = 0.8)
    @body = nil
    if File.exist?('images/block_base.png')
      block = Image.load('images/block_base.png')
    else
      block = Image.new(20, 20)
    end

    @v1 = CP::Vec2.new(x1, y1)
    @v2 = CP::Vec2.new(x1, y2)
    @v3 = CP::Vec2.new(x2, y2+down)
    @v4 = CP::Vec2.new(x2, y1+down)
    verts = [@v1, @v2, @v3, @v4]

    @shape = CP::Shape::Poly.new(CP::Space::STATIC_BODY, verts, CP::Vec2.new(0, 0))
    @image = image || Image.new(x2 - x1 + 1, y2 - y1 + 1, C_WHITE)  

    #((@image.width / block.width) + 1).times do |i|
    #  @image.draw(block.width * i, 0, block)
    #end
    @d = down
    shape.e = e
    shape.u = u
  end

  def move
  end

  def draw
          if @d>0
                 Window.draw_morph(@v1.x, @v1.y, @v2.x, @v2.y+@d, @v3.x, @v3.y, @v4.x, @v4.y, @image)
          else
                 Window.draw_morph(@v1.x, @v1.y, @v2.x, @v2.y, @v3.x, @v3.y-@d, @v4.x, @v4.y, @image)

          end
  end
end
