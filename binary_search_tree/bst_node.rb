class BSTNode
  attr_accessor :val, :left_child, :right_child

  def initialize(val = nil)
    @val = val
    @left = nil
    @right = nil
    @parent = nil
  end
end
