class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    pivot = array.first

    left = array.select { |el| el <= pivot }
    right = array.select { |el| el > pivot }
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    QuickSort.sort2!(array, 0, pivot_idx - start, &prc)
    QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    pivot = array[start]
    pivot_idx = start

    if length == 2
      pivot_idx += 1 if prc.call(array[start + 1], pivot) == -1
    else
      (start + 1).upto(start + length - 1).each do |i|
        if prc.call(array[i], pivot) == -1
          pivot_idx += 1
          array[pivot_idx], array[i] = array[i], array[pivot_idx] if pivot_idx != i
        end
      end
    end
    pivot_idx
  end
end
