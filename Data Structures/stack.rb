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
