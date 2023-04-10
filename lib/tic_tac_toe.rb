require_relative 'board'
require_relative 'messages'
require_relative 'ui'

class TicTacToe

  attr_accessor :board
  def initialize(board)
    @board = board
    # @board = Board.new(@cells)
    @message = Message.new
    @ui = UserInterface.new
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    #@game_board = board.starter_board
  end

  def play
    puts @message.lookup(:welcome)
    puts @message.lookup(:instructions)
  end

end
