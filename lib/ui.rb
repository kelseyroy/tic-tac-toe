require_relative 'messages'

class UserInterface

    def display_board(format_board)
        print format_board
    end

    def display_message(message)
        print message
    end

    def get_spot_input
        spot = gets.chomp.to_i
        return spot
    end
end

