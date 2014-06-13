# LINKED LISTS

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

# STACKS

class ArrayStack
  attr_accessor :top, :values
  def initialize(top, values = [])
    @top = top
    @values = values
    @values << @top
  end

  def push(value)
    @top = value
    @values << value
  end

  def pop
    old_top = @top
    @values.delete_at(-1)
    @top = @values.last
    old_top
  end

end

stack = ArrayStack.new(4)
print "#{stack.values} is the stack's first set of values\n"
stack.push(5)
print "#{stack.values} is the stack's second set of values\n"
print "#{stack.top} should return 5\n"
stack.push(6)
print "#{stack.values} is the stack's third set of values\n"
print "#{stack.top} should return 6\n"
print "#{stack.pop} should return the number 6 and delete it afterward\n"
print "#{stack.values} should show 4 and 5\n"
print "#{stack.top} should now return the number 5\n"

class LinkedListStack
  attr_accessor :top
  def push(value)
    if @top
      old_top = @top
      @top.pointer_ahead = value
      @top = value
      @top.pointer_behind = old_top
    else
      @top = value
    end
  end

  def pop
    old_top = @top
    @top = old_top.pointer_behind
    @top.pointer_ahead = nil; old_top.pointer_ahead = nil; old_top.pointer_behind = nil
    old_top.data
  end

  def show_top
    @top.data
  end
end

class Value
  attr_accessor :data, :pointer_ahead, :pointer_behind
  def initialize(data, pointer_ahead = nil, pointer_behind = nil)
    @data = data
    @pointer_ahead = pointer_ahead
    @pointer_behind = pointer_behind
  end
end

value1 = Value.new(1)
value2 = Value.new(2)
stack = LinkedListStack.new
stack.push(value1)
stack.push(value2)
print "#{stack.pop} should return the number 2 and remove it from the stack\n"
print "#{stack.show_top} should return the number 1 non-destructively\n"

# QUEUES

class ArrayQueue
  attr_accessor :front, :values
  def initialize(values = [])
    @values = values
  end

  def enqueue(value)
    @values << value
    @front = value if @front.nil?
  end

  def dequeue
    @values.delete_at(0)
  end

  def queue_size
    @values.size
  end

end

queue = ArrayQueue.new
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(6)
print "#{queue.values}\n"
print "#{queue.front}\n"
print "#{queue.dequeue} should return and destroy 4\n"
print "#{queue.queue_size} should return 2\n"
print "#{queue.values} should show 5 and 6\n"

class LinkedListQueue
  attr_accessor :front
  def enqueue(value)
    if @front
      head = @front
      head = head.pointer_behind until head.pointer_behind.nil?
      head.pointer_behind = value
      value.pointer_ahead = head
    else
      @front = value
    end
  end

  def dequeue
    old_front = @front
    @front = old_front.pointer_behind
    @front.pointer_ahead = nil; old_front.pointer_ahead = nil; old_front.pointer_behind = nil
    old_front.data
  end

  def queue_size
    counter = 1
    head = @front
    until head.pointer_behind.nil?
      head = head.pointer_behind
      counter += 1
    end
    counter
  end
end

class Value
  attr_accessor :data, :pointer_ahead, :pointer_behind
  def initialize(data, pointer_ahead = nil, pointer_behind = nil)
    @data = data
    @pointer_ahead = pointer_ahead
    @pointer_behind = pointer_behind
  end
end

value1 = Value.new(1)
value2 = Value.new(2)
value3 = Value.new(3)
queue = LinkedListQueue.new
queue.enqueue(value1)
queue.enqueue(value2)
queue.enqueue(value3)
print "#{queue.queue_size}\n"
print "#{queue.dequeue} should return 1 and delete it\n"
print "#{queue.queue_size} should return 2 after deleting 1\n"
print "#{queue.dequeue} should now return 2 and delete it\n"
print "#{queue.queue_size} should return 1 after deleting 2\n"

# N-ARY TREES

class Tree
  attr_accessor :root, :leaves
  def initialize(root = nil, leaves = [])
    @root = root
    @leaves = leaves
  end

  def append_leaf(leaf, parent = nil)
    @root = leaf if @root.nil?
    @leaves << leaf
    if leaf != @root
      parent.children << leaf
      parent.children.sort_by! { |x| x.data }
      leaf.siblings = parent.children
      leaf.parent = parent
    end
  end

  def remove_leaf(leaf)
    if leaf == @root
      @root = leaf.children[(leaf.children.size/2)]
      if @root.siblings.any?
        @root.siblings.each do |sibling|
          @root = sibling.parent
        end
      end
    else
      if leaf.children.any?
        leaf.children.each do |child|
          child.parent = leaf.siblings[(leaf.siblings.size)/2]
        end
      end
      leaf.siblings.each { |sibling| sibling.siblings.delete(leaf) }
    end
    @leaves.delete(leaf)
  end

  def find_leaf(leaf = @root, value)
    if leaf.data == value
      a = leaf
    else
      if leaf.children.any?
        leaf.children.each do |n|
          find_leaf(n, value)
        end
      end
    end
    puts "#{a} with data #{a.data} has been found with parent #{leaf.parent}, which has value #{leaf.parent.data}" unless a.nil?
  end

end

class Leaf
  attr_accessor :data, :parent, :siblings, :children
  def initialize(data, parent = nil, siblings = [], children = [])
    @data = data
    @parent = parent
    @siblings = siblings
    @children = children
  end

end

tree = Tree.new
leaf = Leaf.new(35)
tree.append_leaf(leaf)
leaf2 = Leaf.new(70)
leaf3 = Leaf.new(17)
leaf4 = Leaf.new(42)
leaf5 = Leaf.new(20)
leaf6 = Leaf.new(13)
leaf7 = Leaf.new(80)
leaf8 = Leaf.new(99)
tree.append_leaf(leaf2, leaf)
tree.append_leaf(leaf3, leaf)
tree.append_leaf(leaf4, leaf3)
tree.append_leaf(leaf5, leaf3)
tree.append_leaf(leaf6, leaf5)
tree.append_leaf(leaf7, leaf2)
tree.append_leaf(leaf8, leaf2)
root_children, leaf4_siblings, leaf2_children = [], [], []
tree.root.children.each { |x| root_children << x.data }
leaf4.siblings.each { |x| leaf4_siblings << x.data }
leaf2.children.each { |x| leaf2_children << x.data }
tree.find_leaf(13)
print "#{root_children}\n"
print "#{leaf4_siblings}\n"
print "#{leaf2_children}\n"
tree.remove_leaf(leaf)
puts "#{tree.root} is the tree's root"
puts "#{leaf3} is the 3rd leaf"
puts "#{leaf2} is the 2nd leaf, which is the 3rd leaf's sibling"
tree.remove_leaf(leaf3)
puts "#{leaf4.parent} is leaf4's new parent, which is the 2nd leaf"
puts "#{leaf5.parent} is leaf5's new parent, which is the 2nd leaf as well"

# BINARY TREE TIME!

class BinaryTree
  attr_accessor :data, :left, :right
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def child_nodes
    [@left, @right].compact
  end

  def pre_order(array = [])
    array << @data
    @left.pre_order(array) unless @left.nil?
    @right.pre_order(array) unless @right.nil?
    array
  end

  def in_order(array = [])
    @left.in_order(array) unless @left.nil?
    array << @data
    @right.in_order(array) unless @right.nil?
    array
  end

  def post_order(array = [])
    @left.post_order(array) unless @left.nil?
    @right.post_order(array) unless @right.nil?
    array << @data
    array
  end

  def breadth_first(array = [], queue = [])
    queue << self
    until queue.empty?
      searching = queue.shift
      array << searching.data
      queue << searching.left unless searching.left.nil?
      queue << searching.right unless searching.right.nil?
    end
    array
  end

  def balanced?
    hash = Hash.new
    hash.default = 0
    self.check_side(hash)
    hash[:left] > hash[:right] ? "The left side has more branches than the right" :
    hash[:right] > hash[:left] ? "The right side has more branches than the left" :
    "The tree has the same amount of left and right branches"
  end

  def check_side(hash)
    if @left && @right
      hash[:left] += 1
      hash[:right] += 1
      @left.check_side(hash)
      @right.check_side(hash)
    elsif @left && @right.nil?
      hash[:left] += 1
      @left.check_side(hash)
    elsif @right && @left.nil?
      hash[:right] += 1
      @right.check_side(hash)
    end
  end

  def same_depth?
    hash = Hash.new
    hash.default = 0
    if @left && @right
      hash[:left] = @left.height + 1
      hash[:right] = @right.height + 1
      hash[:left] > hash[:right] ? "The left side has more levels of depth (#{hash[:left]}) than the right (#{hash[:right]})" :
      hash[:right] > hash[:left] ? "The right side has more levels of depth (#{hash[:right]}) than the left (#{hash[:left]})" :
      "The tree has the same level of depth on the left and right side: #{hash[:right]}"
    elsif @left && @right.nil?
      "#{self.height} is the height of the left side with no right"
    elsif @right && @left.nil?
      "#{self.height} is the height of the right side with no left"
    else
      "There's only one node; the root"
    end
  end

  def height
    return 0 if self.child_nodes.empty?
    self.child_nodes.collect {|n| n.height + 1}.max
  end
end

tree = BinaryTree.new(17,
         BinaryTree.new(12,
           BinaryTree.new(6,
             BinaryTree.new(3), BinaryTree.new(8)),
           BinaryTree.new(14,
             nil, BinaryTree.new(13))),
         BinaryTree.new(28,
           BinaryTree.new(23,
             BinaryTree.new(18), BinaryTree.new(25)),
           BinaryTree.new(34,
             BinaryTree.new(29,
               BinaryTree.new(28,
                BinaryTree.new(11), BinaryTree.new(17)),
               nil),
             BinaryTree.new(30)))
        )

# The tree is deeper on the right side, yet has the same amount of left and right "branches"
puts tree.same_depth?
puts tree.balanced?
print "#{tree.pre_order}\n"
print "#{tree.in_order}\n"
print "#{tree.post_order}\n"
print "#{tree.breadth_first}\n"
