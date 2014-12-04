require_relative 'spec_helper'
require_relative '../../ruby/my_queue'

describe "MyQueue Results" do


  context "Node class tests" do
    let(:node) do
      Node.new(1)
    end

    it "returns a Node object" do
      expect(node).to be_an_instance_of(Node)
    end

    it "returns the value of the node" do
      expect(node.value).to be 1
    end

    it "has a nil next_node" do
      expect(node.next_node).to eq nil
    end

    it "has the right next_node value" do
      second_node = Node.new(2)
      node.next_node = second_node
      expect(node.next_node). to eq second_node
    end

  end

  context "MyQueue class tests" do
    let(:queue) do
      MyQueue.new()
    end

    it "returns a MyQueue object" do
      expect(MyQueue.new()).to be_an_instance_of(MyQueue)
    end

   it "adds an element to the back of the queue" do
      queue = MyQueue.new()
      expect(queue.peek).to eq nil
      queue.enqueue(3)
      expect(queue.peek).to eq 3
    end

    it "returns elem at the top of the queue w/o removing" do
      queue.enqueue(2)
      expect(queue.peek).to eq 2
    end


    it "returns the size of the queue" do
      queue.enqueue(2)
      queue.enqueue(4)
      expect(queue.size).to eq 2
    end

    it "returns the element at the top of the queue" do
      queue.enqueue(2)
      queue.enqueue(4)
      queue.enqueue(6)
      expect(queue.size).to eq 3
      expect(queue.dequeue).to eq 2
      expect(queue.size).to eq 2
      expect(queue.peek).to eq 4
    end

    it "returns false if queue is not empty" do
      queue.enqueue(6)
      expect(queue.empty?).to be false
    end

    it "returns true if queue is empty" do
      expect(queue.empty?).to be true
    end
  end
end
