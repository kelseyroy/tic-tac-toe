require 'spec_helper'
require './lib/game_play.rb'

describe GamePlay do
  before(:each) do
    @game_play = GamePlay.new
  end

  it 'expects true to be true' do
    expect(true).to eq true
  end

end