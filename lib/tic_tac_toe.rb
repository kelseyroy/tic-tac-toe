require_relative 'board'
require_relative 'messages'

class TicTacToe
  def initialize
    @board = Board.new
    @message = Message.new
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
