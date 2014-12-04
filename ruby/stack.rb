require 'pry'
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class Stack
  attr_accessor :head, :depth

  def initialize(first_value = nil)
    @head = nil
    @depth = nil
    push(first_value) if first_value
  end

  def push(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
    @depth += 1
  end

  def pop
    node = @head
    @head = node.next_node
    @depth -= 1
    node.value
  end

  def peek
    @head.value
  end

end

