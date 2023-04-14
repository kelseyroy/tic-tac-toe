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
end
