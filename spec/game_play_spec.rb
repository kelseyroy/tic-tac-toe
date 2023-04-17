require 'spec_helper'
require './lib/game_play.rb'
require './lib/ui.rb'
require './lib/messages.rb'
require './lib/validate.rb'

describe GamePlay do
  before(:each) do
    @ui = UserInterface.new
    @messages = Message.new
    @game_play = GamePlay.new(@ui, @messages)
    @board = ['O', 2, 3, 4, 'X', 6, 7, 8, 9]
  end

  it 'can determine the next player' do
    current_player = "X"
    next_player = "O"
    expect(@game_play.get_next_player(current_player)).to eq next_player
  end

  it 'updates the board when a player places a mark' do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_play.mark_board(board, 'X', 5)
    @game_play.mark_board(board, 'O', 1)
    result = ['O', 2, 3, 4, 'X', 6, 7, 8, 9]
    expect(board).to eq result
  end

  context "get_spot" do
    let(:ui) {double('UserInterface', get_spot_input: nil)}

    it 'select spot returns a valid player input as spot' do
        allow(@ui).to receive(:get_spot_input).and_return(9)
        expect(@game_play.select_spot(@board)).to eq(9)
    end  

    it 'reprompt the player if their input is invalid' do
        allow(@ui).to receive(:get_spot_input).and_return(5, 9)
        expect(@game_play.select_spot(@board)).to eq(9)
    end
  end

  context "end_of_game" do

    it 'returns null if the board is blank' do
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
      result = @game_play.end_of_game(board)
      expect(result).to eq(nil)
    end

    context "three marks in a row" do
      it 'returns win if a player marks every cell in first row' do
        board = ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] 
        result = @game_play.end_of_game(board)
        expect(result).to eq('win')
      end
      
      it 'returns win if a player marks every cell in second row' do
        board = [1, 2, 3, 'X', 'X', 'X', 7, 8, 9] 
        result = @game_play.end_of_game(board)
        expect(result).to eq('win')
      end

      it 'returns win if a player marks every cell in third row' do
        board = [1, 2, 3, 4, 5, 6, 'X', 'X', 'X'] 
        result = @game_play.end_of_game(board)
        expect(result).to eq('win')
      end

      it 'returns null if a player has 3 Xs but not in a row' do
        board = [1, 'X', 'X', 'X', 5, 6, 7, 8, 9] 
        result = @game_play.end_of_game(board)
        expect(result).to eq(nil)
      end
    end
    
    context "three marks in a column" do

      it 'returns win if a player marks every cell in first column' do
        board = ['X', 2, 3, 'X', 5, 6, 'X', 8, 9] 
        result = @game_play.end_of_game(board)
        expect(result).to eq 'win'
      end

      it 'returns win if a player marks every cell in second column' do
        board = [1, 'X', 3, 4, 'X', 6, 7, 'X', 9] 
        result = @game_play.end_of_game(board)
        expect(result).to eq 'win'
      end

      it 'returns win if a player marks every cell in third column' do
        board = [1, 2, 'X', 4, 5, 'X', 7, 8, 'X'] 
        result = @game_play.end_of_game(board)
        expect(result).to eq('win')
      end

      it 'returns null if a player has 3 Xs but not in a column' do
        board = [1, 'X', 3, 4, 'X', 6, 7, 8, 'X'] 
        result = @game_play.end_of_game(board)
        expect(result).to eq(nil)
      end
    end

    context 'three marks in a diagonal' do

      it 'returns win if a player marks every cell in left to right diagonal' do
        board = ['X', 2, 3, 4, 'X', 6, 7, 8, 'X'] 
        result = @game_play.end_of_game(board)
        expect(result).to eq('win')
      end

      it 'returns win if a player marks every cell in right to left diagonal' do
        board = [1, 2, 'X', 4, 'X', 6, 'X', 8, 9] 
        result = @game_play.end_of_game(board)
        expect(result).to eq('win')
      end

      it 'returns null if a player has 3 Xs but not in a diagonal' do
        board = [1, 'X', 3, 4, 'X', 6, 7, 8, 'X'] 
        result = @game_play.end_of_game(board)
        expect(result).to eq(nil)
      end
    end
  end

  context "draw" do

    it 'returns draw if there are no more playable spaces' do
      board = ['X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O']
      result = @game_play.end_of_game(board)
      expect(result).to eq('draw')
    end

      it 'returns null if there are available spaces but no winner' do
      board = ['X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 9]
      result = @game_play.end_of_game(board)
      expect(result).to eq(nil)
    end
  end
end
