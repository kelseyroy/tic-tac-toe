require 'spec_helper'
require './lib/board.rb'


describe Board do
  before(:each) do
    @test_board = Board.new
    @empty_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it 'updates the board when a player places a mark' do
    board = @empty_board.dup
    @test_board.mark_board(board, 'X', 5)
    @test_board.mark_board(board, 'O', 1)
    result = ['O', 2, 3, 4, 'X', 6, 7, 8, 9]
    expect(board).to eq result
  end

  it 'prevents a player from marking a spot that has already been played' do
    board = ['O', 2, 3, 4, 'X', 6, 7, 8, 9]
    test_spot = 5
    expect(@test_board.free_spot?(board, test_spot)).to be false
  end
end

