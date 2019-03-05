require 'chipmunk'
require 'dxruby'

  # Spaceオブジェクトを作る
  space = CP::Space.new

  #重力
  space.gravity = CP::Vec2.new(0, 100)
  body = CP::Body.new(1, CP::INFINITY)
  body.p = CP::Vec2.new(100,100)

  #ボールを生成 第2引数は当たり判定の半径
  shape = CP::Shape::Circle.new(body, 40, CP::Vec2.new(0, 0))
      #ボールの特性
      #circle.shape.e = 1.0 #弾性力
      #circle.shape.u = 1.0 #摩擦
  # SpaceにBodyとShapeを登録
  space.add_body(body)
  space.add_shape(shape)

static_body = CP::Body.new_static
static_body.p = CP::Vec2.new(0, 0)


  image = Image.load("img/ball-g.png",20,20)
  wall_image = Image.new(640, 80)

 Window.loop do
  space.step(1.0/60.0)
  Window.draw(body.p.x-10, body.p.y-10, image)
  Window.draw(0, 400, wall_image)
 end
