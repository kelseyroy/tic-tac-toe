class Validate

    def validate_input(input, board)
        raise ArgumentError, "Invalid Input: Not a number between 1-9." unless valid_input?(input) 
        raise ArgumentError, "Invalid Input: Spot is already occupied." unless free_spot?(input, board) 

        true
    end

    private

    def valid_input?(input)
        (1..9).to_a.include?(input) 
    end

    def free_spot?(input, board)
      board[input - 1] != 'X' && board[input - 1]  != 'O'
    end
end