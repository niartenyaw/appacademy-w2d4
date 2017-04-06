
# TC : O(n**2)
def naive_windowed(arr, size)
  current_max_range = nil

  (0..arr.length - size).each do |i|
    window = arr[i, size]
    min, max = window.min, window.max
    current_max_range = max - min if current_max_range.nil? || max - min > current_max_range
  end

  current_max_range
end

# TC : O(n)
def windowed_max_range(arr, size)
  queue = MyQueue.new

  (0...size).each do |i|
    queue.enqueue(arr[i])
  end

  current_max_range = queue.max - queue.min

  (size...arr.length).each do |i|
    queue.dequeue
    queue.enqueue(arr[i])
    diff = queue.max - queue.min
    current_max_range = diff if diff > current_max_range
  end

  current_max_range
end


class MyQueue

  attr_reader :min, :max

  def initialize
    @store = MyStack.new
    @off_stack = MyStack.new
    @min = nil
    @max = nil
  end

  def enqueue(el)
    check_max_min(el)
    @store.push(el)
  end

  def dequeue
    @store.size.times do
      @off_stack.push(@store.pop)
    end

    popped = @off_stack.pop
    @min, @max = nil, nil

    @off_stack.size.times do
      transfer = @off_stack.pop
      check_max_min(transfer)
      @store.push(transfer)
    end

    popped
  end

  def check_max_min(el)
    @min, @max = el, el if @min.nil?
    @min = el if el < @min
    @max = el if el > @max
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

end


class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
