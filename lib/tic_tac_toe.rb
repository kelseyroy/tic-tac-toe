require_relative 'board'

class TicTacToe
  def initialize
    @board = Board.new
  end

  def play
    puts "\nDo you want to play a game? Y or N\n"
    puts display_board
  end

  def display_board
    @board.draw_board
  end
end
