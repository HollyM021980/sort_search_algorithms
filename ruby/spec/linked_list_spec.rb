require 'pry'
require_relative 'spec_helper'
require_relative '../../ruby/linked_list'

describe "LinkedList Results" do
  before(:each) do
    @list =  LinkedList.new(1)
  end

  it "creates a new linked list" do
    expect(@list).to be_an_instance_of(LinkedList)
  end

  it "sets the size correctly" do
    expect(@list.size).to eq 1
  end

  it "sets head and tail correctly" do
    expect(@list.head).to eq @list.tail
  end


  it "correctly recognizes and empty list" do
    @list.pop
    expect(@list.empty?).to be true
    expect(@list.head).to be nil
    expect(@list.tail).to be nil
  end

  it "adds a single element to the front of the list" do
    curr_head = @list.head
    new_head = @list.prepend(4)
    expect(@list.first.value).to eq 4
    expect(@list.tail).to eq curr_head
    expect(@list.head).to eq new_head
  end

  it "adds multiple element to the front of the list" do
    @list.prepend(2)
    @list.prepend(4)
    expect(@list.first.value).to eq 4
    expect(@list.empty?).to be false
  end

  it "gets the value of the last element on the list" do
    expect(@list.last.value).to be 1
  end

  it "adds an element to the end of the list" do
    @list.append(4)
    expect(@list.size).to eq 2
    expect(@list.last.value).to eq 4
  end

  it "gets the length of the list" do
    @list.prepend(2)
    @list.append(4)
    @list.prepend(6)
    expect(@list.size).to be 4
  end

  it "removes the only from the list" do
    expect(@list.pop.value).to eq 1
    expect(@list.size).to be 0
    expect(@head).to be nil
    expect(@tail).to be nil
  end

  it "removes the first element from the list" do
    @list.prepend(2)
    @list.append(4)
    expect(@list.pop.value).to be 2
    expect(@list.head.value).to be 1
  end

  it "finds an element in the list by value" do
    @list.prepend(2)
    @list.append(4)
    @list.prepend(6)
    expect(@list.find(4).value).to be 4
    expect(@list.size).to be 4
  end

  it "reverses the list without destroying original" do
    @list.append(2)
    new_list = @list.reverse
    expect(@list.head.value).to eq(new_list.tail.value)
    expect(@list.tail.value).to eq(new_list.head.value)
  end

  it "destructively reverses the list" do
    @list.append(2)
    new_list = @list.reverse!
    expect(@list).to equal new_list
  end


end
