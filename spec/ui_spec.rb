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

    xit 'will re-prompt player for a valid spot' do
        allow(@ui).to receive(:gets).and_return("0", "5")
        expect(@ui.get_spot).to eq(5)
    end
end

