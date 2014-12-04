require 'pry'

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

end

class MyQueue
  attr_accessor :size, :head, :tail


# Make new empty queue
# Add item to the back of the queue
# Remove item from the front of the queue
# Look at item at the front of the queue w/o removing
# Ask for size of the queue
# Ask if empty
# second pass, refactor to use a "Node class" instead of Array

  def initialize(value = nil)
    @head = nil
    @tail = nil
    @size = 0
    enqueue(value) if value
  end

  def enqueue(value)
    node = Node.new(value)
    if empty?
      @head = Node.new(value)
    else
      @tail.next_node = node
    end
    @tail = node
    @size += 1
  end

  def dequeue
    unless empty?
      node = @head
      @head = node.next_node
      @size =- 1
      node.value
    end
  end

  def empty?
    @head == nil
  end

  def peek
    return nil if @head == nil
    @head.value
  end

end
