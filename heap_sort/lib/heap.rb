class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[count-1] = @store[count-1], @store[0]
    popped = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    popped
  end

  def peek

  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count-1)
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
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    sorted = false
    while !sorted
      sorted = true
      i = 0
      children = BinaryMinHeap.child_indices(len, i)
      while children.length > 0 do
        if children.length == 1
          if prc.call(array[children[0]], array[i]) == -1
            array[children[0]], array[i] = array[i], array[children[0]]
            sorted = false
          end
        else
          if prc.call(array[children[0]], array[i]) == -1 ||
            prc.call(array[children[1]], array[i]) == -1

            case prc.call(array[children[0]], array[children[1]])
            when 1
              array[i], array[children[1]] = array[children[1]], array[i]
            when 0
              array[i], array[children[0]] = array[children[0]], array[i]
            when -1
              array[i], array[children[0]] = array[children[0]], array[i]
            end
            sorted = false
            break
          end
        end
        i += 1
        children = BinaryMinHeap.child_indices(len, i)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    begin
      parent = BinaryMinHeap.parent_index(child_idx)
    rescue
      return array
    end

    for i in 0..len do
      if prc.call(array[child_idx], array[parent]) == -1
        array[child_idx], array[parent] = array[parent], array[child_idx]
        child_idx = parent
        begin
          parent = BinaryMinHeap.parent_index(child_idx)
        rescue
          break
        end
      end
    end
    array
  end
end
