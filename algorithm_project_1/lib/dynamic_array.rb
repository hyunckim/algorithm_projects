require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    @store[@length] = nil
    @length -=1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @store.length == @length
    @store[@length] = val
    @length+=1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length == 0
    @length -= 1
    shift = @store[0]
    (0..(@length-1)).each do |i|
      @store[i] = @store[i + 1]
    end
    shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length +=1
    resize! if @length == @capacity
    @length.downto(1) do |i|
      @store[i] = @store[i-1]
    end
    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    temp_store = @store
    @capacity += 8
    @store = StaticArray.new(@capacity)
    (0..@length).each do |i|
      @store[i] = temp_store[i]
    end
  end
end
