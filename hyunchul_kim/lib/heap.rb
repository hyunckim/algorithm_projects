class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count

  end

  def extract

  end

  def peek

  end

  def push(val)

  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    left_child = (parent_index * 2) + 1
    right_child = (parent_index * 2) + 2
    if left_child >= len
      return []
    elsif right_child >= len
      return [left_child]
    else
      return [left_child, right_child]
    end
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    parent_index = (child_index -1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
