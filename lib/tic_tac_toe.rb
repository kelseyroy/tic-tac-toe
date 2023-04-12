require_relative 'board'
require_relative 'messages'
require_relative 'ui'

class TicTacToe
  attr_accessor :starter_board
  
  def initialize(board)
    @board = board
    @starter_board = @board.starter_board
    @message = Message.new
    @ui = UserInterface.new
  end

  def play
    @ui.display_message(@message.lookup(:welcome))
    @ui.display_message(@message.lookup(:instructions))
    @ui.display_board(@board.format_board(@starter_board))
  end
end
