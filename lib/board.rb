class Board
  
  attr_accessor :starter_board
  def initialize
    @starter_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  end

  def free_spot?(board, spot)
    board[spot - 1] != 'X' && board[spot - 1]  != 'O'
  end

  def mark_board(board, player_mark, spot)
      board[spot - 1] = player_mark
  end
end
