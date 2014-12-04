require_relative 'spec_helper'
require_relative '../../ruby/node'

describe "Node Results" do


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
    expect(node.next_node).to eq second_node
  end

end
