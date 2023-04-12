class GamePlay
    
    PLAYER_MARKS = ["X", "O"].freeze

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

    def take_turns(player_mark)
        @message
        @ui.get_spot_input

    end

    def select_spot
        is_valid = false
        is_empty = false
        spot = 0
        while !is_valid || is_empty
        @ui.display_message(@messages.lookup(:get_spot))
        spot = @ui.get_spot_input

        return spot.to_i
    end

    private

    def valid_input?(spot)
        
        (1..9).to_a.include?(spot)
    end
    
    def free_spot?(board, spot)
        board[spot - 1] != 'X' && board[spot - 1]  != 'O'
    end
end