require_relative 'spec_helper'
require_relative '../../ruby/dl_node'

describe "DoubleLinkedNode Results" do


  let(:node) do
    DoubleLinkedNode.new(1)
  end

  it "returns a Double Linked Node object" do
    expect(node).to be_an_instance_of(DoubleLinkedNode)
  end

  it "returns the value of the node" do
    expect(node.value).to be 1
  end

  it "has a nil next_node" do
    expect(node.next_node).to eq nil
  end

  it "has a nil prev_node" do
    expect(node.prev_node).to eq nil
  end

  it "has the right next_node value" do
    second_node = DoubleLinkedNode.new(2)
    node.next_node = second_node
    expect(node.next_node).to eq second_node
  end

  it "has the right prev_node value" do
    second_node = DoubleLinkedNode.new(2)
    second_node.prev_node = node
    expect(second_node.prev_node).to eq node
 end


end
