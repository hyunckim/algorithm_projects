class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    hash = self.map.with_index { |el, index| (el*(index+1)).hash }
    hash.inject(:+)
  end
end

class String
  def hash
    hash = self.chars.map.with_index { |char| char.ord }
    hash.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0
    self.each do |key, value|
      hash += key.hash + value.hash
    end
    hash
  end
end
