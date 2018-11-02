class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)    
    unless self.include?(key.hash)
      self[key.hash] << key
      @count += 1
    end
    
    resize! if @count > num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    
    prev_nums = prev_store.flatten
    @count = 0
    prev_nums.each {|key| insert(key)}
  end
end
