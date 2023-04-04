require 'spec_helper'
require './lib/game_over'

describe GameOver do
  before(:each) do
    @game_over = GameOver.new
  end

  describe "winning row combinations" do

    it 'returns true if a player marks every cell in first row' do
      board = ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns true if a player marks every cell in second row' do
      board = [1, 2, 3, 'X', 'X', 'X', 7, 8, 9] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns true if a player marks every cell in third row' do
      board = [1, 2, 3, 4, 5, 6, 'X', 'X', 'X'] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns false if a player has 3 Xs but not in a row' do
      board = [1, 'X', 'X', 'X', 5, 6, 7, 8, 9] 
      result = @game_over.win?(board)
      expect(result).to eq false
    end
  end

  describe "winning column combinations" do

    it 'returns true if a player marks every cell in first column' do
      board = ['X', 2, 3, 'X', 5, 6, 'X', 8, 9] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns true if a player marks every cell in second column' do
      board = [1, 'X', 3, 4, 'X', 6, 7, 'X', 9] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns true if a player marks every cell in third column' do
      board = [1, 2, 'X', 4, 5, 'X', 7, 8, 'X'] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns false if a player has 3 Xs but not in a column' do
      board = [1, 'X', 3, 4, 'X', 6, 7, 8, 'X'] 
      result = @game_over.win?(board)
      expect(result).to eq false
    end
  end

  describe "winning diagonal combinations" do

    it 'returns true if a player marks every cell in left to right diagonal' do
      board = ['X', 2, 3, 4, 'X', 6, 7, 8, 'X'] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns true if a player marks every cell in right to left diagonal' do
      board = [1, 2, 'X', 4, 'X', 6, 'X', 8, 9] 
      result = @game_over.win?(board)
      expect(result).to eq true
    end

    it 'returns false if a player has 3 Xs but not in a diagonal' do
      board = [1, 'X', 3, 4, 'X', 6, 7, 8, 'X'] 
      result = @game_over.win?(board)
      expect(result).to eq false
    end
  end

  describe "tie" do

    it 'returns true if there are no more playable spaces' do
      board = ['X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O']
      result = @game_over.tie?(board)
      expect(result).to eq true
    end

      it 'returns false if there are available spaces' do
      board = ['X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 9]
      result = @game_over.tie?(board)
      expect(result).to eq false
    end
  end
end
