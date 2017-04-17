require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }
    BinaryMinHeap.heapify_down(self, 0, &prc)
    i = self.length-1
    while i > 0
      self[0], self[i] = self[i], self[0]
      i -= 1

      parent = 0

      children = BinaryMinHeap.child_indices(self.length, parent)
      while children.length > 0 && children[0] <= i
        heafied = false
        if children.length == 2 && children[1] <= i
          if prc.call(self[children[0]], self[parent]) == -1 ||
            prc.call(self[children[1]], self[parent]) == -1

            case prc.call(self[children[0]], self[children[1]])
            when 1
              self[parent], self[children[1]] = self[children[1]], self[parent]
              parent = children[0]
              heafied = true
            when 0
              self[parent], self[children[0]] = self[children[0]], self[parent]
              parent = children[0]
              heafied = true
            when -1
              self[parent], self[children[0]] = self[children[0]], self[parent]
              parent = children[0]
              heafied = true
            end
          end

        else
          if prc.call(self[children[0]], self[parent]) == -1
            self[children[0]], self[parent] = self[parent], self[children[0]]
            parent = children[0]
            heafied = true
          end
        end
        if heafied == false
          break
        else
          children = BinaryMinHeap.child_indices(self.length, parent)
        end
      end
    end
    self
  end
end
