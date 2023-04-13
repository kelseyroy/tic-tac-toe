require_relative 'messages'
require_relative 'ui'

class Validate
    
    def initialize
        @message = Message.new
        @ui = UserInterface.new
    end

    def validate_input(input, board)
        if valid_input?(input) && free_spot?(input, board)
            return true
        else
            return false
        end 
    end

    private

    def valid_input?(input)
        (1..9).to_a.include?(input) 
    end

    def free_spot?(input, board)
      board[input - 1] != 'X' && board[input - 1]  != 'O'
    end
end