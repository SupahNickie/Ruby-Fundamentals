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
