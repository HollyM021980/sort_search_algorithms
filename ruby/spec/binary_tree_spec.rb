require 'pry'
require_relative 'spec_helper'
require_relative '../../ruby/binary_tree'

describe "Binary Tree Test Results" do

  before(:each) do
    @node = BNode.new("levi")
    @tree = BinaryTree.new
  end


  describe "BNode results" do

    it "creates a new node" do
      expect(@node).to be_an_instance_of(BNode)
    end

    it "is a leaf node" do
      expect(@node.leaf?).to be true
    end

    it "returns its value" do
      expect(@node.value).to eq "levi"
    end

    it "inserts a value greater than the root on the right" do
      new_node =(@node.insert("mary"))
      expect(@node.right_branch).to equal new_node
    end

    it "inserts a value less than the root on the left" do
      new_node =(@node.insert("bob"))
      expect(@node.left_branch).to equal new_node
    end

  end

  describe "BTree results" do
    it "creates a new tree object" do
      expect(@tree).to be_an_instance_of(BinaryTree)
    end

    it "has an empty root" do
      expect(@tree.root).to be nil
    end

    it "makes the first value the root node" do
      @tree.insert("levi")
      expect(@tree.root.value).to eq "levi"
    end

    it "adds the next value to the correct branch from the root" do
       @tree.insert("levi")
       @tree.insert("mary")
       expect(@tree.root.right_branch.value).to eq "mary"
    end

    it "adds third value to the correct branch from the root" do
       @tree.insert("levi")
       @tree.insert("mary")
       @tree.insert("bob")
       expect(@tree.root.left_branch.value).to eq "bob"
    end

    it "adds fourth value a leaf of the correct branch" do
       @tree.insert("levi")
       @tree.insert("mary")
       @tree.insert("bob")
       @tree.insert("billy")
       expect(@tree.root.left_branch.left_branch.value).to eq "billy"
    end

    it "returns false if the tree is empty" do
      expect(@tree.has?("billy")).to be false
    end


    it "returns false if the value is not found" do
      @tree.insert("levi")
      @tree.insert("mary")
      @tree.insert("bob")
      @tree.insert("billy")
      expect(@tree.has?("notthere")).to be false
    end

    it "returns true if the value is found" do
      @tree.insert("levi")
      @tree.insert("mary")
      @tree.insert("bob")
      @tree.insert("billy")
      expect(@tree.has?("billy")).to be true
      expect(@tree.has?("mary")).to be true
      expect(@tree.has?("bob")).to be true
      expect(@tree.has?("levi")).to be true
    end


  end

end
