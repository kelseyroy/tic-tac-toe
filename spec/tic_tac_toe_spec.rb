require 'spec_helper'
require './lib/tic_tac_toe'
require './lib/board.rb'

describe TicTacToe do
  before(:each) do
    board = Board.new
    @test_game = TicTacToe.new(board)
  end

  it 'can display the starter board' do
    result = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(@test_game.starter_board).to eq result
  end

end

