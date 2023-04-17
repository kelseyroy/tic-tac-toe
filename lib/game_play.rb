require_relative 'validate'

class GamePlay
    
    PLAYER_MARKS = ["X", "O"].freeze

    # TODO: Is this the correct place for the UI and Mes?
    def initialize(ui, messages, player_marks=nil)
        @ui = ui
        @messages = messages
        player_marks ||= PLAYER_MARKS
        @player_marks = player_marks
        @validate = Validate.new
    end

    def get_next_player(player)
        if player == @player_marks[0]
            return @player_marks[1]
        else
            return @player_marks[0]
        end
    end

    def mark_board(board, player_mark, spot)
         board[spot - 1] = player_mark
    end

    def select_spot(board)
        @ui.display_message(@messages.lookup(:get_spot))
        spot = @ui.get_spot_input
        is_valid = @validate.valid_free_spot?(spot, board)
        if !is_valid
            @ui.display_message(@messages.lookup(:invalid_input)) 
            return select_spot(board)
        else
            return spot
        end
    end

    def check_for_win_draw(board) #different name? check for win or draw.increases specificity
        if win?(board)
            return 'win'
        elsif is_board_full?(board)
            return 'draw'
        else
            return nil
        end
    end

    private
    
    def win?(board)
        if check_rows(board) || check_columns(board) || check_diagonals(board)
          return true
        else
          return false
        end
    end

    def is_board_full?(board)
      if board.uniq.length > 2
        return false
      else
        return true
      end
    end

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
