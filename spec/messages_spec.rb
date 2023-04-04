require 'spec_helper'
require './lib/messages'

describe Message do
  before(:each) do
    @test_message = Message.new
  end

  describe "welcome messages" do

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
  
  describe "player turns" do
  
    it 'can prompt x to play' do
      expected_message = "X's turn! Please enter an available space between 1-9:"
      actual_message = @test_message.player_prompt('X')
      expect(expected_message).to eq actual_message
    end

    it 'can prompt o to play' do
      expected_message = "O's turn! Please enter an available space between 1-9:"
      actual_message = @test_message.player_prompt('O')
      expect(expected_message).to eq actual_message
    end
  end

  describe "game over messages" do
    
    it 'can declare x the winner' do
      expected_message = "Game Over, X got three in a row!"
      actual_message = @test_message.game_over('X')
      expect(expected_message).to eq actual_message
    end

    it 'can declare o the winner' do
      expected_message = "Game Over, O got three in a row!"
      actual_message = @test_message.game_over('O')
      expect(expected_message).to eq actual_message
    end
  end
end
