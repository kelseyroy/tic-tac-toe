require 'spec_helper'
require './lib/messages'

describe Message do
  
  before(:all) do
    @mock_messages = {test_message: "this is a test message"}
    @message = Message.new(@mock_messages)
  end

  describe "lookup" do
    it 'throws an error when a message is not defined' do
      expect {
        result = @message.lookup(:does_not_exist)
      }.to raise_error(ArgumentError, "Message does not exist")     
    end

    it 'displays a message when a message is defined' do
      result = @message.lookup(:test_message)

      expect(result).to eq(@mock_messages[:test_message])
    end
  end
  context "add message" do
    it 'throws an error when a message already exists' do
      expect { 
        @message.add(:test_message, "this is a different test")
      }.to raise_error(ArgumentError, "Message already exists")
    end

    it 'adds a unique message to the hash table' do
      string = "this should be included in the hash table"
      @message.add(:add_message, string)
      
      expect(string).to eq(@mock_messages[:add_message])
    end
  end
end
