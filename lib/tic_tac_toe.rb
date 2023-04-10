require_relative 'board'
require_relative 'messages'
require_relative 'ui'

class TicTacToe
  attr_accessor :board
  
  def initialize(board)
    @board = board
    @message = Message.new
    @ui = UserInterface.new
  end

  def play
    @ui.display(@message.lookup(:welcome))
    @ui.display(@message.lookup(:instructions))
  end
end
