require "spec_helper"
require "./lib/validate"

describe Validate do
  before(:each) do
    @board = ["O", 2, 3, 4, "X", 6, 7, 8, 9]
    @test_validate = Validate.new
  end

  it "returns false when a input is not valid" do
    expect(@test_validate.valid_free_spot?(0, @board)).to eq(false)
  end

  it "returns false when the player selects a spot that is occupied" do
    expect(@test_validate.valid_free_spot?(5, @board)).to eq(false)
  end

  it "returns true if input is valid and spot if available" do
    expect(@test_validate.valid_free_spot?(2, @board)).to eq(true)
  end
end
