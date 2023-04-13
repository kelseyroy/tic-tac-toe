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
    @validate = Validate.new
    @board = ['O', 2, 3, 4, 'X', 6, 7, 8, 9]
  end

  let(:ui) {double('UserInterface', get_spot_input: nil)}
  let(:validate) {double('Validate', validate_input: nil)}

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

  describe "get_spot" do

    it 'select spot returns a valid player input as spot' do
        allow(@ui).to receive(:get_spot_input).and_return(9)
        expect(@game_play.select_spot(@board)).to eq(9)
    end  

    it 'reprompt the player if their input is invalid' do
        allow(@ui).to receive(:get_spot_input).and_return(5, 9)
        expect(@game_play.select_spot(@board)).to eq(9)
    end
  end
end
