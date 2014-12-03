require_relative 'spec_helper'
require_relative '../b_search'

describe "Bsearch Results" do

  arr = [1,2,3,4,5,6,7,8,9,10]

  it "returns a valid index at the upper end" do
    expect(arr.b_search(10)).to eq(9)
  end

  it "returns a valid index at the lower end" do
    expect(arr.b_search(1)).to eq(0)
  end

  it "returns a valid index somewhere in the middle" do
    expect(arr.b_search(7)).to eq(6)
  end

  it "returns -1 when not found" do
    expect(arr.b_search(100)).to eq(-1)
  end

end
