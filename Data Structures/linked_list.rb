class LinkedList
  attr_accessor :stores, :head, :tail
  def initialize(stores = [], head = nil, tail = nil)
    @stores = stores
    @head = head
    @tail = tail
  end

  def append(node)
    if @stores.empty?
      @head = node
      @tail = node
    else
      @tail.after = node
      node.previous = @tail
      @tail = node
    end
    @stores << node
  end

  def prepend(node)
    if @stores.empty?
      @head = node
      @tail = node
    else
      @head.previous = node
      node.after = @head
      @head = node
    end
    @stores << node
  end

  def list_stores
    @stores.each do |data|
      if data == @head
        puts "This is the head"
        puts "#{data.after} is the after node"
      elsif data == @tail
        puts "This is the tail"
        puts "#{data.previous} is the previous node"
      else
        puts "#{data.after} is the after node"
        puts "#{data.previous} is the previous node"
      end
      puts "#{data.data} is the data; #{data} is the actual object"
      puts ""
    end
  end

  def search(position)
    counter = @head
    position.times do
      @node = counter
      counter = counter.after
    end
    @node
  end

  def delete(position)
    node = self.search(position)
    if node == @head
      node_above = node.after
      node_above.previous = nil
      @head = node_above
    elsif node == @tail
      node_below = node.previous
      node_below.after = nil
      @tail = node_below
    else
      node_above = node.after
      node_below = node.previous
      node_above.previous = node.previous
      node_below.after = node.after
    end
    node.data = nil
    @stores.delete(node)
  end

  def remove_duplicates
    counter = @head
    position = 1
    instances = Hash.new
    instances.default = 0
    until counter.nil?
      instances[counter.data] += 1
      if instances[counter.data] > 1
        self.delete(position)
        instances = Hash.new
        instances.default = 0
        counter = @head
        position = 1
      else
        counter = counter.after
        position += 1
      end
    end
  end
end

class Node
  attr_accessor :data, :after, :previous
  def initialize(data, after = nil, previous = nil)
    @data = data
    @after = nil
    @previous = nil
  end
end

list = LinkedList.new
node1 = Node.new(5)
node2 = Node.new(9)
node3 = Node.new(13)
node4 = Node.new(3)
node5 = Node.new(13)
node6 = Node.new(8)
node7 = Node.new(3)
node8 = Node.new(5)
node9 = Node.new(5)
list.append(node1)
list.append(node2)
list.prepend(node3)
list.prepend(node4)
list.append(node5)
list.append(node6)
list.append(node7)
list.append(node8)
list.append(node9)
list.list_stores
list.search(3)
list.delete(1)
list.delete(1)
list.delete(2)
list.delete(list.stores.size)
list.list_stores
puts "GETTING RID OF DATA"
list.remove_duplicates
list.list_stores
