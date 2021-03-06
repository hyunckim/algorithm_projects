require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    self.map = {}
    self.queue = BinaryMinHeap.new do |k1, k2|
      prc.call(self.map[k1], self.map[k2])
    end
  end

  def [](key)
    return nil unless self.map.has_key?(key)
    self.map[key]
  end

  def []=(key, value)
    if self.map.has_key?(key)
      update(key, value)
    else
      insert(key, value)
    end
  end

  def count
    self.map.count
  end

  def empty?
    count == 0
  end

  def extract
    key = self.queue.extract
    value = self.map.delete(key)

    [key, value]

  end

  def has_key?(key)
    self.map.has_key?(key)
  end

  protected
  attr_accessor :map, :queue

  def insert(key, value)
    self.map[key] = value
    self.queue.push(key)

    nil
  end

  def update(key, value)
    raise "tried to update non-existent key" unless self.map.has_key?(key)
    self.map[key] = value
    self.queue.reduce!(key)
    nil
  end
end
