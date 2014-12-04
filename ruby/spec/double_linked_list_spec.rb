require 'pry'
require_relative 'spec_helper'
require_relative '../../ruby/double_linked_list'
require_relative '../../ruby/dl_node'

describe "DoubleLinkedList Results" do
  before(:each) do
    @list =  DoubleLinkedList.new
  end

  it "creates a new double linked list" do
    expect(@list).to be_an_instance_of(DoubleLinkedList)
  end

  it "sets the size correctly" do
    expect(@list.size).to eq 0
  end

  it "sets head and tail correctly" do
    expect(@list.head).to eq @list.tail
  end

  it "correctly recognizes and empty list" do
    expect(@list.empty?).to be true
    expect(@list.head).to be nil
    expect(@list.tail).to be nil
  end


  # Only one thing in the list
  it "adds a single element to the front of the list" do
    orig_head = @list.head
    new_head = @list.prepend(4)
    expect(new_head.value).to be 4
    expect(@list.tail).to eq new_head
    expect(@list.head).to eq new_head
  end

  # Prepend multiple
  it "adds the element to the front of a larger list" do
    orig_head = @list.head
    node2 = @list.prepend(4)
    node1 = @list.prepend(6)
    expect(@list.head.value).to be 6
    expect(@list.tail).to eq node2
    expect(@list.head.next_node).to eq node2
    expect(@list.tail.prev_node).to eq node1
  end

  it "returns the first element on the list" do
    @list.prepend(2)
    expect(@list.first.value).to eq @list.head.value
  end

  it "removes the first element in the list" do
    @list.prepend(2)
    node = @list.pop
    expect(node.value).to be 2
    expect(@list.empty?).to be true
  end

  it "adjusts the head and tail" do
    @list.prepend(2)
    node = @list.pop
    expect(@list.head).to be nil
    expect(@list.tail).to be nil
  end

  it "adds multiple elements to the front of the list" do
    @list.prepend(2)
    @list.prepend(4)
    expect(@list.first.value).to eq 4
    expect(@list.empty?).to be false
  end

  it "sets prev and next properly" do
    @list.prepend(2)
    @list.prepend(4)
    expect(@list.first.next_node).to eq @list.tail
    expect(@list.tail.prev_node).to eq @list.head
  end


  it "gets the value of the last element on the list" do
    @list.prepend(1)
    expect(@list.last.value).to be 1
    expect(@list.last).to eq @tail
  end

  # it "adds an element to the end of the list" do
  #   @list.append(4)
  #   expect(@list.size).to eq 2
  #   expect(@list.last.value).to eq 4
  # end

  # it "gets the length of the list" do
  #   @list.prepend(2)
  #   @list.append(4)
  #   @list.prepend(6)
  #   expect(@list.size).to be 4
  # end

  # it "removes the only from the list" do
  #   expect(@list.pop.value).to eq 1
  #   expect(@list.size).to be 0
  #   expect(@head).to be nil
  #   expect(@tail).to be nil
  # end

  # it "removes the first element from the list" do
  #   @list.prepend(2)
  #   @list.append(4)
  #   expect(@list.pop.value).to be 2
  #   expect(@list.head.value).to be 1
  # end

  # it "finds an element in the list by value" do
  #   @list.prepend(2)
  #   @list.append(4)
  #   @list.prepend(6)
  #   expect(@list.find(4).value).to be 4
  #   expect(@list.size).to be 4
  # end

  # it "reverses the list without destroying original" do
  #   @list.append(2)
  #   new_list = @list.reverse
  #   expect(@list.head.value).to eq(new_list.tail.value)
  #   expect(@list.tail.value).to eq(new_list.head.value)
  # end

  # it "destructively reverses the list" do
  #   @list.append(2)
  #   new_list = @list.reverse!
  #   expect(@list).to equal new_list
  # end


end
