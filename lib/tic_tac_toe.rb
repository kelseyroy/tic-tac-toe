require_relative 'messages'
require_relative 'ui'
require_relative 'game_play'

class TicTacToe
  
  def initialize(board=nil)
    board ||= [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = board
    @message = Message.new
    @ui = UserInterface.new
    @game = GamePlay.new(@ui, @message)
  end

  def play
    @ui.display_message(@message.lookup(:welcome))
    @ui.display_message(@message.lookup(:instructions))
    @ui.display_board(@board)
  end
end
