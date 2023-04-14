class Validate

    def valid_free_spot?(input, board)
        if valid_integer?(input) && free_spot?(input, board)
            return true
        else
            return false
        end 
    end

    private

    def valid_integer?(input)
        (1..9).to_a.include?(input) 
    end

    def free_spot?(input, board)
      board[input - 1] != 'X' && board[input - 1]  != 'O'
    end
end
