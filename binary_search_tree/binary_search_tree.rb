require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = BSTNode.new(root)
  end

  def find(el)
    node = @root

    while !node.nil?
      return true if el == node

      if el < node
        node = node.left

      else
        node = node.right
      end
    end
    false
  end

  def insert(el)
    case el <=> root
    when -1
      if @root.left
        @root.left.insert(el)
      else
        left = BinarySearchTree.new(el)
        @root.left = left
        left.parent = @root
      end
    when 0
      if @root.left
        @root.left.insert(el)
      else
        left = BinarySearchTree.new(el)
        @root.left = left
        left.parent = @root
      end
    when 1
      if @root.right
        @root.right.insert(el)
      else
        right = BinarySearchTree.new(el)
        @root.right = right
        right.parent = @root
      end
    end
    self
  end

  def delete(el)
    return nil if !find(el)
    node = @root
    until node == el
      if el < node
        node = node.left
      else
        node = node.right
      end
    end
    if node.left.nil? && node.right.nil?
      parent = node.parent
      parent.left = nil if parent.left.val = el.val
      parent.right = nil if parent.right.val = el.val
    elsif node.right.nil?
      node.parent.left = node.left if parent.left.val = el.val
      node.parent.right = node.left if parent.right.val = el.val
      node.left.parent = node.parent
    else
      max = node.maximum
      max.parent = node.parent
      node.parent.right = max if parent.right.val = el.val
      node.parent.left = max if parent.left.val = el.val
    end
  end

  def is_balanced?
  end

  def in_order_traversal
  end

  def maximum
    maximum = @root
    until maximum.right.nil?
      maximum = maximum.right
    end
    maximum
  end

  def depth
  end
end
