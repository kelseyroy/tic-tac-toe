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
    end

    def select_spot
        is_valid = false
        is_empty = false
        spot = 0
        # until is_valid && is_empty do
        @ui.display_message(@messages.lookup(:get_spot))
        spot = @ui.get_spot_input
            # is_valid = validate_input(spot)
        # end
        return spot
    end

    def validate_input(spot)
        raise ArgumentError, "Not a number between 1-9" unless valid_input?(spot)
        valid_input?(spot)
    end

    private

    def valid_input?(spot)
        (1..9).to_a.include?(spot)
    end

end