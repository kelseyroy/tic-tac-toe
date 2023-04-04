require_relative 'board'
require_relative 'game_over'
require_relative 'messages'

class TicTacToe
  def initialize
    @board = Board.new
    @game_over = GameOver.new
    @message = Message.new
  end

  def play
    puts @message.welcome
    puts @message.instructions
    puts display_board
  end

  def display_board
    @board.draw_board
  end
end
