require_relative 'dl_node'

class DoubleLinkedList
  attr_accessor :size, :head, :tail

# insert after a node
# prepend a node at beginning of the list (done)
# append a node at the end of the list (done)
# pop - remove first node and return node (done)
# get last node in the list (done)
# retrieve the head/first node in the list (done)
# return the length of the list (done)
# find a node with a value (find)
# reverse the list and return w/o destruct
# reverse the list and return and destroy

  def initialize(value = nil)
    node = value ? DoubleLinkedNode.new(value) : nil
    @head = node
    @tail = node
    empty? ? @size = 0 : @size = 1
  end


  def prepend(value)
    # binding.pry
    node = DoubleLinkedNode.new(value)
    if empty?
      @tail = node
    else
      node.prev_node = nil
      @head.prev_node = node
      node.next_node = @head
    end
    @head = node
    @size += 1
    node
  end

  # def append(value)
  #   node = Node.new(value)

  #   if empty?
  #     @head = node
  #   else
  #     @tail.next_node = node
  #   end

  #   @size += 1
  #   @tail = node
  # end

  def last
    return @tail unless empty?
    nil
  end

  def first
    return nil if empty?
    @head
  end

  def pop
    return nil if empty?
    node = @head
    if (@head == @tail)
      @head, @tail = nil
    else
      @head = node.next_node
      @head.next_node = node.next_node
    end
    @size -= 1
    node
  end

  def empty?
    @head == nil
  end

  # def find(val)
  #   return nil if empty?

  #   found = false
  #   curr = @head
  #   until (found || curr == nil) do
  #     if (curr.value == val)
  #       found = true
  #     else
  #       curr = curr.next_node
  #     end
  #   end
  #   return curr
  # end

  # def reverse
  #   new_list = LinkedList.new(@head.value);
  #   curr = @head.next_node
  #   until curr == nil
  #     new_list.prepend(curr.value)
  #     curr = curr.next_node
  #   end
  #   new_list
  # end



  # def copy!(list)
  #   return nil if self.size != list.size
  #   self_curr = self.head
  #   list_curr = list.head
  #   until self_curr == nil do
  #     self_curr.value = list_curr.value
  #     self_curr = self_curr.next_node
  #     list_curr = list_curr.next_node
  #   end
  #   return self
  # end

  # def reverse!
  #   reversed = self.reverse
  #   return copy!(reversed)
  # end



end




