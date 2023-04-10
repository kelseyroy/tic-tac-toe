require 'spec_helper'
require './lib/ui.rb'

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
        expect {@ui.display(message)}.to output(message).to_stdout
    end
end

