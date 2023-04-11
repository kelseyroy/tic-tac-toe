require_relative 'messages'

class UserInterface

    def display(message)
        print message
    end

    def get_spot_input
        spot = gets.chomp.to_i
        return spot
    end
end

