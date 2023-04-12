class Board
  attr_accessor :starter_board
  
  def initialize
    @starter_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def mark_board(board, player_mark, spot)
      board[spot - 1] = player_mark
  end

  def free_spot?(board, spot)
    board[spot - 1] != 'X' && board[spot - 1]  != 'O'
  end

  def format_board(board)
    line_break = "\n"
    grid_lines = "===+===+==="
    board_grid = line_break +
    " #{board[0]} | #{board[1]} | #{board[2]} " + line_break +
    grid_lines + line_break +
    " #{board[3]} | #{board[4]} | #{board[5]} " + line_break +
    grid_lines + line_break +
    " #{board[6]} | #{board[7]} | #{board[8]} " + line_break +
    line_break
    
    return board_grid
  end
end
