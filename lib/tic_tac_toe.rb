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
    @game_end = nil
  end

  def play
    @ui.display_message(@message.lookup(:welcome))
    @ui.display_message(@message.lookup(:instructions))
    @ui.display_board(@board)
    while !@game_end do
      take_turns
    end
    game_over
  end

  private 
  
  def take_turns
    spot = @game.select_spot(@board)
    @game.mark_board(@board, @current_player, spot)
    @ui.display_board(@board)
    @game_end = @game.check_for_win_draw(@board) 
    if !@game_end
      @current_player = @game.get_next_player(@current_player)
    end
  end

  def game_over
    if @game_end == 'draw'
      @ui.display_message(@message.lookup(:draw))
    else
      @ui.display_message(@message.lookup(:"#{@current_player}_win")) 
    end
  end
end
