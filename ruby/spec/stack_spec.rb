require 'pry'
require_relative 'spec_helper'
require_relative '../../ruby/stack'

describe "Stack Results" do

  let(:stack) do
    Stack.new()
  end

  it "returns a Stack object" do
    expect(stack).to be_an_instance_of(Stack)
  end

  it "adds an element to the top of the stack" do
    expect(stack.peek).to eq nil
    stack.push(3)
    expect(stack.peek).to eq 3
  end

  it "returns a Node object" do
    expect(Node.new(1)).to be_an_instance_of(Node)
  end


  it "returns elem at the top of the stack w/o removing" do
    stack.push(2)
    expect(stack.peek).to eq(2)
  end


  it "returns the depth of the stack" do
    stack.push(2)
    stack.push(4)
    expect(stack.depth).to eq 2
  end

  it "returns the element at the top of the stack" do
    stack.push(2)
    stack.push(4)
    stack.push(6)
    expect(stack.depth).to eq 3
    elem = stack.pop
    expect(elem).to eq 6
    expect(stack.peek).to eq 4
  end

  it "returns false if stack is not empty" do
    stack.push(6)
    expect(stack.empty?).to be false
  end

  it "returns true if stack is empty" do
    expect(stack.empty?).to be true
  end
end
