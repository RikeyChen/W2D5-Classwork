require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end 

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return first.val if first.key == key
      
    current_node = first
    until current_node == @tail
      if current_node.next.key == key
        return current_node.next.val
      else
        current_node = current_node.next
      end
    end
    nil
  end

  def include?(key)
    get(key) ? true : false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev_node = @tail.prev
    
    new_node.prev = prev_node  #this set's new_node's prev to prev_node
    new_node.next = @tail      #this set's new_node's next to tail
    prev_node.next = new_node  #this sets prev_node's next to new node
    @tail.prev = new_node      #this set's tail's prev to new_node
  end

  def update(key, val)
    self[key]
  end

  def remove(key)
    current_node = first
    
    until current_node == @tail
      if current_node.key == key
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
        current_node.next = nil
        current_node.prev = nil
      else
        current_node = current_node.next
      end
    end
    nil
  end

  def each(&prc)
    current_node = first
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
    
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
