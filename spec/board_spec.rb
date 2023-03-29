require 'spec_helper'
require './lib/board.rb'


describe Board do
  before(:each) do
    @test_board = Board.new
  end

  it 'an empty board has no marks' do
    expect(@test_board.draw_board).to eq "\n 1 | 2 | 3 \n===+===+===\n 4 | 5 | 6 \n===+===+===\n 7 | 8 | 9 \n\n"
  end

  it 'updates the board when a player places a mark' do
    @test_board.mark_board('X', 5)
    @test_board.mark_board('O', 1)
    expect(@test_board.draw_board).to eq "\n O | 2 | 3 \n===+===+===\n 4 | X | 6 \n===+===+===\n 7 | 8 | 9 \n\n"
  end

  it 'prevents a player from marking a spot that has already been played' do
    @test_board.mark_board('X', 5)
    @test_board.mark_board('O', 5)
    expect(@test_board.draw_board).to eq "\n 1 | 2 | 3 \n===+===+===\n 4 | X | 6 \n===+===+===\n 7 | 8 | 9 \n\n"
  end

  it 'prevents a player from marking a spot with something other than X or O' do
    @test_board.mark_board('Y', 5)
    expect(@test_board.draw_board).to eq "\n 1 | 2 | 3 \n===+===+===\n 4 | 5 | 6 \n===+===+===\n 7 | 8 | 9 \n\n"
  end

end
