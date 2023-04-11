require 'spec_helper'
require './lib/ui.rb'
require './lib/board.rb'

describe UserInterface do
    before(:each) do
        @ui = UserInterface.new
    end

    it 'can get a spot input from the player' do
        allow(@ui).to receive(:gets).and_return("5")
        expect(@ui.get_spot_input).to eq(5)
    end

    it 'can display a message to the player' do
        message = "\nmessage test\n"
        expect {@ui.display_message(message)}.to output(message).to_stdout
    end

    it 'can display a formatted board to the player' do
        board = Board.new
        format_board = board.format_board([1, 2, 3, 4, 'X', 6, 7, 8, 'O'])
        expected_output = "\n 1 | 2 | 3 \n===+===+===\n 4 | X | 6 \n===+===+===\n 7 | 8 | O \n\n"
        expect {
            @ui.display_board(format_board)
        }.to output(expected_output).to_stdout
    end
    
end

