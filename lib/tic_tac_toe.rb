require_relative 'messages'
require_relative 'ui'
require_relative 'game_play'

class TicTacToe
  
  def initialize(board=nil, current_player=nil)
    board ||= [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = board
    @message = Message.new
    @ui = UserInterface.new
    @game = GamePlay.new(@ui, @message)
    current_player ||= 'X'
    @current_player = current_player
    @num_of_turns = 0
  end

  def play
    @ui.display_message(@message.lookup(:welcome))
    @ui.display_message(@message.lookup(:instructions))
    @ui.display_board(@board)
    while @num_of_turns < 9 do
      take_turns
      @num_of_turns += 1
    end
  end

  private 
  
  def take_turns
    spot = @game.select_spot(@board)
    @game.mark_board(@board, @current_player, spot)
    @ui.display_board(@board)
    @current_player = @game.get_next_player(@current_player)
  end
end
