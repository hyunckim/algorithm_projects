require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_link!(@map[key])
    else
      @store.append(key, calc!(key))
      @map[key] = @store.last
      eject! if count > @max
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    @prc.call(key)
  end

  def update_link!(link)
    link.remove
    @store.append(link.key, link.val)
  end

  def eject!
    node = @store.first
    node.remove
    @map.delete(node.key)
  end
end
