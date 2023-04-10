class GamePlay

  def format_board(cells)
    line_break = "\n"
    grid_lines = "===+===+==="
    board_grid = line_break +
    " #{cells[0]} | #{cells[1]} | #{cells[2]} " + line_break +
    grid_lines + line_break +
    " #{cells[3]} | #{cells[4]} | #{cells[5]} " + line_break +
    grid_lines + line_break +
    " #{cells[6]} | #{cells[7]} | #{cells[8]} " + line_break +
    line_break
    
    return board_grid
  end

  def free_spot?(chosen_cell)
    chosen_cell != 'X' && chosen_cell != 'O'
  end

  def mark_board(cells, player_mark, spot)
      cells[spot - 1] = player_mark
  end

  def win?(board)
    if check_rows(board) || check_columns(board) || check_diagonals(board)
      return true
    else
      return false
    end
  end

  def tie?(board)
    if board.uniq.length > 2
      return false
    else
      return true
    end
  end

  private

  def three_in_a_row(nested_arr)
    nested_arr.each do |arr| 
      if arr.uniq.length == 1
        return true
      end
    end
    return false
  end

  def check_rows(board)
    row_one = [board [0], board[1] , board[2]]
    row_two = [board [3], board[4] , board[5]]
    row_three = [board [6], board[7] , board[8]]
    return three_in_a_row([row_one, row_two, row_three])
  end

  def check_columns(board)
    column_one = [board [0], board[3] , board[6]]
    column_two = [board [1], board[4] , board[7]]
    column_three = [board [2], board[5] , board[8]]
    return three_in_a_row([column_one, column_two, column_three])
  end

  def check_diagonals(board)
    diagonal_one = [board [0], board[4] , board[8]]
    diagonal_two = [board [2], board[4] , board[6]]
    return three_in_a_row([diagonal_one, diagonal_two]) 
  end
end
