class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def rebalance
    array_of_nodes, middle_node = order_nodes_for_rebalance
    array_of_nodes.each { |x| delete(x.value) unless x == @root }
    @root = nil
    insert(Node.new(middle_node.value))
    array_of_nodes.each { |x| insert(Node.new(x.value)) }
    array_of_nodes.clear
  end

  def insert(insert_node, node = @root)
    if @root.nil?
      @root = insert_node
    elsif insert_node.value < node.value
      if node.left.nil?
        node.left = insert_node
        insert_node.parent = node
      else
        insert(insert_node, node.left)
      end
    elsif insert_node.value > node.value
      if node.right.nil?
        node.right = insert_node
        insert_node.parent = node
      else
        insert(insert_node, node.right)
      end
    elsif contains?(insert_node.value)
      puts "The value #{insert_node.value} is already present in the tree"
    end
  end

  def contains?(value, node = @root)
    breadth_first.include?(value) ? true : false
  end

  def size(node = @root)
    return "No elements in tree" if @root.nil?
    counter = 1 + traverse_down(node)
  end

  def depth(node = @root)
    return 1 if node.children.empty?
    node.children.collect { |x| 1 + depth(x) }.max
  end

  def balance(node = @root)
    left = 1 + traverse_down(node.left) if node.left
    right = 1 + traverse_down(node.right) if node.right
    result = left - right
    result < 0 ? "The tree is right heavy by #{result.abs} elements" : result > 0 ? "The tree is left heavy by #{result.abs} elements" : "The tree is ideally balanced"
  end

  def pre_order(node = @root, array = [])
    array << node
    pre_order(node.left, array) unless node.left.nil?
    pre_order(node.right, array) unless node.right.nil?
    array.collect { |x| x.value }
  end

  def in_order(node = @root, array = [])
    in_order(node.left, array) unless node.left.nil?
    array << node
    in_order(node.right, array) unless node.right.nil?
    array.collect { |x| x.value }
  end

  def post_order(node = @root, array = [])
    post_order(node.left, array) unless node.left.nil?
    post_order(node.right, array) unless node.right.nil?
    array << node
    array.collect { |x| x.value }
  end

  def breadth_first(node = @root, array = [], queue = [])
    queue << node
    until queue.empty?
      searching = queue.shift
      array << searching
      queue << searching.left unless searching.left.nil?
      queue << searching.right unless searching.right.nil?
    end
    array.collect { |x| x.value }
  end

  def delete(value, node = @root, array = [])
    if contains?(value)
      traverse_for_deletion(value, node, array)
      node_to_delete = array[0]
      if node_to_delete.children.empty?
        node_to_delete == node_to_delete.parent.left ? node_to_delete.parent.left = nil : node_to_delete.parent.right = nil
        node_to_delete.parent, node_to_delete.left, node_to_delete.right = nil, nil, nil
      elsif node_to_delete.children.size == 1
        child_node = node_to_delete.children[0]
        node_to_delete == node_to_delete.parent.left ? node_to_delete.parent.left = child_node : node_to_delete.parent.right = child_node
        child_node.parent = node_to_delete.parent
        node_to_delete.parent, node_to_delete.left, node_to_delete.right = nil, nil, nil
      elsif node_to_delete.children.size == 2
        child_node = node_to_delete.children[0]
        child_node_2 = node_to_delete.children[1]
        node_to_delete == node_to_delete.parent.left ? node_to_delete.parent.left = child_node : node_to_delete.parent.right = child_node
        child_node.right = child_node_2
        child_node_2.parent = child_node
        node_to_delete.parent, node_to_delete.left, node_to_delete.right = nil, nil, nil
      end
    end
  end

private

  def order_nodes_for_rebalance(node = @root, array = [])
    order_nodes_for_rebalance(node.left, array) unless node.left.nil?
    array << node
    order_nodes_for_rebalance(node.right, array) unless node.right.nil?
    return [array, array[array.size/2]]
  end

  def traverse_for_deletion(value, node, array)
    if node.value == value
      array << node
    else
      traverse_for_deletion(value, node.left, array) unless node.left.nil?
      traverse_for_deletion(value, node.right, array) unless node.right.nil?
    end
  end

  def traverse_down(node)
    return 0 if node.children.empty?
    node.children.collect { |x| 1 + traverse_down(x) }.reduce(:+)
  end
end

class Node
  attr_accessor :value, :left, :right, :parent
  def initialize(value, left = nil, right = nil, parent = nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
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
puts "DOES THE TREE CONTAIN 7? #{tree.contains?(7)}"
puts "DOES THE TREE CONTAIN 32? #{tree.contains?(32)}"
puts "DOES THE TREE CONTAIN 97? #{tree.contains?(97)}"
puts "#{tree.size} IS THE TREE'S SIZE"
puts tree.depth
puts tree.balance
puts tree.pre_order.inspect
puts tree.in_order.inspect
puts tree.post_order.inspect
puts tree.breadth_first.inspect
tree.delete(16)
puts "DOES THE TREE CONTAIN 16? #{tree.contains?(16)}"
puts tree.pre_order.inspect
tree.delete(3)
puts "DOES THE TREE CONTAIN 3? #{tree.contains?(3)}"
puts tree.pre_order.inspect
puts tree.in_order.inspect
puts tree.post_order.inspect
puts tree.breadth_first.inspect
puts "#{tree.size} IS THE TREE'S SIZE"
tree.rebalance
puts tree.pre_order.inspect
puts tree.root.value
puts tree.root.left.value
puts tree.root.right.value
puts tree.root.left.right.value
puts tree.root.left.right.right.value
puts tree.root.right.right.value
