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
    return 1 if self.child_nodes.empty?
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
