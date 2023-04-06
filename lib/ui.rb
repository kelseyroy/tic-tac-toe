require_relative 'messages'

class UserInterface
    def initialize
        @message = Message.new
    end

    def start_game
        puts @message.lookup(:welcome)
        puts @message.lookup(:instructions)
        puts display_board
    end

    def get_spot
        puts @message.lookup(:get_spot)
        spot = gets.chomp.to_i
        if valid_spot?(spot)
            return spot
        else
            puts @message.lookup(:invalid_input)
            get_spot
        end
    end

    def valid_spot?(spot)
        (1..9).to_a.include?(spot)
    end
end