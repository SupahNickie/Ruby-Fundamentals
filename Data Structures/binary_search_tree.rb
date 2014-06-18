class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(node = @root, insert_node)
    if @root.nil?
      @root = insert_node
    elsif insert_node.value < node.value
      node.left.nil? ? node.left = insert_node : insert(node.left, insert_node)
    elsif insert_node.value > node.value
      node.right.nil? ? node.right = insert_node : insert(node.right, insert_node)
    elsif contains?(insert_node.value)
      puts "The value #{insert_node.value} is already present in the tree"
    end
  end

  def contains?(node = @root, value)
    node.value == value ? true : node.children.each { |x| contains(x, value) }
  end

  def size(node = @root)
    return "No elements in tree" if @root.nil?
    counter = 1 + traverse_down(node)
  end

  def traverse_down(node)
    return 0 if node.children.empty?
    node.children.collect { |x| 1 + traverse_down(x) }.reduce(:+)
  end

  def depth(node = @root)
    return 0 if node.children.empty?
    node.children.collect { |x| 1 + depth(x) }.max
  end

  def balance(node = @root)
    left = 1 + traverse_down(node.left) if node.left
    right = 1 + traverse_down(node.right) if node.right
    result = left - right
  end

  def pre_order(node = @root, array = [])
    array << node.value
    pre_order(node.left, array) unless node.left.nil?
    pre_order(node.right, array) unless node.right.nil?
    array
  end

  def in_order(node = @root, array = [])
    in_order(node.left, array) unless node.left.nil?
    array << node.value
    in_order(node.right, array) unless node.right.nil?
    array
  end

  def post_order(node = @root, array = [])
    post_order(node.left, array) unless node.left.nil?
    post_order(node.right, array) unless node.right.nil?
    array << node.value
    array
  end

  def breadth_first(node = @root, array = [], queue = [])
    queue << node
    until queue.empty?
      searching = queue.shift
      array << searching.value
      queue << searching.left unless searching.left.nil?
      queue << searching.right unless searching.right.nil?
    end
    array
  end
end

class Node
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def children
    [@left, @right].compact
  end
end

tree = BinarySearchTree.new
node1 = Node.new(7)
node2 = Node.new(3)
node3 = Node.new(19)
node4 = Node.new(32)
node5 = Node.new(7)
node6 = Node.new(16)
node7 = Node.new(9)
node8 = Node.new(4)
node9 = Node.new(1)
tree.insert(node1)
tree.insert(node2)
tree.insert(node3)
tree.insert(node4)
tree.insert(node5)
tree.insert(node6)
tree.insert(node7)
tree.insert(node8)
tree.insert(node9)
puts tree.root.value
puts tree.root.left.value
puts tree.root.right.value
puts tree.root.right.right.value
puts tree.root.right.left.value
puts tree.root.right.left.left.value
puts tree.root.left.right.value
puts tree.root.left.left.value
puts tree.contains?(7)
puts tree.size
puts tree.depth
puts tree.balance
puts tree.pre_order.inspect
puts tree.in_order.inspect
puts tree.post_order.inspect
puts tree.breadth_first.inspect
