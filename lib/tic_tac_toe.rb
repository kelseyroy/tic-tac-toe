require_relative 'game_play'
require_relative 'messages'
require_relative 'ui'

class TicTacToe
  def initialize
    @game = GamePlay.new
    @message = Message.new
    @ui = UserInterface.new
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def play
    puts @message.lookup(:welcome)
    puts @message.lookup(:instructions)
    puts display_board
  end

end
