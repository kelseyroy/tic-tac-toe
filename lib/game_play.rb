require_relative 'validate'

class GamePlay
    
    PLAYER_MARKS = ["X", "O"].freeze

    def initialize(ui, messages, player_marks=nil)
        @ui = ui
        @messages = messages
        player_marks ||= PLAYER_MARKS
        @player_marks = player_marks
        @validate = Validate.new
    end

    def get_next_player(player)
        return @player_marks[1] if player == @player_marks[0]

        return @player_marks[0]
    end

    def mark_board(board, player_mark, spot)
      board[spot - 1] = player_mark
    end

    def select_spot(board, player_mark)
      @ui.display_message(@messages.lookup(:"#{player_mark}_get_spot"))
      spot = @ui.get_spot_input
      is_valid = @validate.valid_free_spot?(spot, board)
      if !is_valid
          @ui.display_message(@messages.lookup(:invalid_input)) 
          return select_spot(board, player_mark)
      end
      
      spot
    end

    def check_for_win_draw(board)
      return 'win' if win?(board)
      return 'draw' if is_board_full?(board)

      nil
    end

    private
    
    def win?(board)
      check_rows(board) || check_columns(board) || check_diagonals(board)
    end

    def is_board_full?(board)
      board.uniq.length <= 2
    end

    def three_in_a_row(nested_arr)
      nested_arr.each do |arr| 
        if arr.uniq.length == 1
          return true
        end
      end

      false
    end
    
    def check_rows(board)
      row_one = [board [0], board[1] , board[2]]
      row_two = [board [3], board[4] , board[5]]
      row_three = [board [6], board[7] , board[8]]

      three_in_a_row([row_one, row_two, row_three])
    end

    def check_columns(board)
      column_one = [board [0], board[3] , board[6]]
      column_two = [board [1], board[4] , board[7]]
      column_three = [board [2], board[5] , board[8]]

      three_in_a_row([column_one, column_two, column_three])
    end

    def check_diagonals(board)
      diagonal_one = [board [0], board[4] , board[8]]
      diagonal_two = [board [2], board[4] , board[6]]

      three_in_a_row([diagonal_one, diagonal_two]) 
    end
end
