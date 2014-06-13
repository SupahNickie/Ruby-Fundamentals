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
