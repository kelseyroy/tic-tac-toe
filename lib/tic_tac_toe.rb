require_relative 'board'
require_relative 'messages'
require_relative 'ui'

class TicTacToe
  def initialize
    @board = Board.new
    @message = Message.new
    @ui = UserInterface.new
    @num_of_turns = 0
  end

  def play
    puts @message.lookup(:welcome)
    puts @message.lookup(:instructions)
    puts display_board
  end

  def display_board
    @board.draw_board
  end

end

