require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @start_idx = 0
    @store = StaticArray.new(@capacity)
    @length = 0
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[index + @start_idx]
  end

  # O(1)
  def []=(index, val)
    @store[index + @start_idx] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    pop = @store[@length-1 + @start_idx]
    @store[@length - 1 + @start_idx] = nil
    @length -=1
    pop
  end

  # O(1) ammortized
  def push(val)
    @length+=1
    resize! if @length > @capacity
    @store[@length-1 + @start_idx] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if @length == 0
    @length -= 1
    shift = @store[@start_idx]
    @store[@start_idx] = nil
    @start_idx += 1
    shift
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    resize! if @length > @capacity
    @start_idx -= 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    temp_store = @store
    @capacity += 8
    @store = StaticArray.new(@capacity)
    (@length-1).times do |i|
      @store[i] = temp_store[@start_idx + i]
    end
    p temp_store
    @start_idx = 0
  end
end
