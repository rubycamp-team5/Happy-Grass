require_relative 'cp/cp_base'
require_relative 'cp/cp_circle'
require_relative 'cp/cp_box'
require_relative 'cp/cp_static_box'
require_relative 'cp/cp_static_slope'

class CP::Shape::Circle
  attr_accessor :parent_obj
end

class CP::Shape::Poly
  attr_accessor :parent_obj
end
