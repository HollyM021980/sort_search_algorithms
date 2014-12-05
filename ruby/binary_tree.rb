require 'pry'

class BNode
  attr_accessor :left_branch, :right_branch, :value

  def initialize(value)
    @value = value
    @left_branch = nil
    @right_branch = nil
    self
  end

  def find(value)
  end

  def insert(value)
    if value < @value
      @left_branch.nil? ? @left_branch = BNode.new(value) : @left_branch.insert(value)
    elsif value > @value
      @right_branch.nil? ? @right_branch = BNode.new(value) : @right_branch.insert(value)
    end
  end

  def leaf?
    left_branch.nil? && right_branch.nil?
  end

end

class BinaryTree

# Binary Tree class
  attr_accessor :root

  def initialize
    @root = nil
  end

  def search(value, node=@root)
    return false if node.nil?
    return true if node.value == value
    return search(value, node.left_branch) if value < node.value
    return search(value, node.right_branch) if value > node.value
    false # just in case :)
  end

  def has?(value)
    self.search(value)
  end

  def insert(value)
    if root.nil?
      @root = BNode.new(value)
    else
      @root.insert(value)
    end
  end



end
