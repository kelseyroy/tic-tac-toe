require 'spec_helper'
require './lib/messages'

describe Message do
  
  describe "lookup" do
    it 'throws an error when a message is not defined' do
      test_message = Message.new

      expect {
        result = test_message.lookup(:does_not_exist)
      }.to raise_error(ArgumentError, "Message does not exist")     
    end

    it 'displays a message when a message is defined' do
      test_message = Message.new

      result = test_message.lookup(:welcome)

      expect(result).to eq "Welcome to Tic Tac Toe!" 
    end
  end
end
