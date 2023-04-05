require 'spec_helper'
require './lib/messages'

describe Message do
  before(:each) do
    @test_message = Message.new
  end
  
  it 'returns welcome message' do
    expected_message = "Welcome to Tic Tac Toe!"
    actual_message = @test_message.welcome
    expect(expected_message).to eq actual_message
  end

  it 'returns instructions' do
    expected_message = "Tic Tac Toe is a two player game played on a 3 x 3 grid.  When prompted, each player will place their mark by entering a number between 1-9 that corresponds with an available square on the grid."
    actual_message = @test_message.instructions
    expect(expected_message).to eq actual_message
  end

end
