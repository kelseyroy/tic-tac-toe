class GamePlay
    
    PLAYER_MARKS = ["X", "O"].freeze

    # TODO: Is this the correct place for the UI and Mes?
    def initialize(ui, messages, player_marks=nil)
        @ui = ui
        @messages = messages
        player_marks ||= PLAYER_MARKS
        @player_marks = player_marks
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

    def free_spot?(board, spot)
      board[spot - 1] != 'X' && board[spot - 1]  != 'O'
    end

    def select_spot
        @ui.display_message(@messages.lookup(:get_spot))
        spot = @ui.get_spot_input

        return spot
    end

    def validate_input(spot)
        valid_number = (1..9).to_a.include?(spot) 
        raise ArgumentError, "Not a number between 1-9" unless valid_number 
        
       true
    end
end
