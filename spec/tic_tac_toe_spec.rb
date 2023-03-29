require 'spec_helper'
require './lib/tic_tac_toe'

describe TicTacToe do
  before(:each) do
    @test_game = TicTacToe.new
  end

  it 'can access draw_board from Board class' do
    expect(@test_game.display_board).to eq "\n 1 | 2 | 3 \n===+===+===\n 4 | 5 | 6 \n===+===+===\n 7 | 8 | 9 \n\n"
  end

end
