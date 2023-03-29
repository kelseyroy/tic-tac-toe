class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
  end

  def draw_board
    "\n" +
    " #{@board[0]} | #{@board[1]} | #{@board[2]} " + "\n" +
    "===+===+===" + "\n" +
    " #{@board[3]} | #{@board[4]} | #{@board[5]} " + "\n" +
    "===+===+===" + "\n" +
    " #{@board[6]} | #{@board[7]} | #{@board[8]} " + "\n" +
    "\n"
  end

  def free_spot?(spot)
    @board[spot - 1] != 'X' && @board[spot - 1] != 'O'
  end

  def valid_marker?(player_mark)
    player_mark == 'X' || player_mark == 'O'
  end

  def mark_board(player_mark, spot)
    if !valid_marker?(player_mark)      
      puts "\n I don't recognize #{player_mark}. Try again with X or O.\n"
    elsif free_spot?(spot)
      @board[spot - 1] = player_mark
    else 
      puts "\n Sorry, that spot is taken. Please try a again.\n"
    end
  end
end

