require_relative 'cp/cp_base'
require_relative 'cp/cp_circle'
require_relative 'cp/cp_box'
require_relative 'cp/cp_static_box'
require_relative 'cp/cp_static_slope'
require_relative 'cp/cp_ball'
require_relative 'cp/goal'
require_relative 'cp/goal_box.rb'
require_relative 'cp/cp_string'

class CP::Shape::Circle
  attr_accessor :parent_obj
end

class CP::Shape::Poly
  attr_accessor :parent_obj
end
