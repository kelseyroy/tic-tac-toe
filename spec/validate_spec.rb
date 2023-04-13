require 'spec_helper'
require './lib/validate.rb'

describe Validate do
    before(:each) do
        @board = ['O', 2, 3, 4, 'X', 6, 7, 8, 9] 
        @test_validate = Validate.new
    end

    it 'throws an error when a input is not invalid' do
        expect {
          @test_validate.validate_input(0, @board)
        }.to raise_error(ArgumentError, "Invalid Input: Not a number between 1-9.")     
      end

      it 'throws an error when the player selects a spot that is occupied' do
        expect {
          @test_validate.validate_input(5, @board)
        }.to raise_error(ArgumentError, "Invalid Input: Spot is already occupied.") 
      end
  
      it 'returns true if input is valid and spot if available' do
          expect(@test_validate.validate_input(2, @board)).to eq(true)
      end

end