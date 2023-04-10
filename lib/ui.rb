require_relative 'messages'

class UserInterface

    def display_board(board)
        line_break = "\n"
        grid_lines = "===+===+==="
        board_grid = line_break +
        " #{board[0]} | #{board[1]} | #{board[2]} " + line_break +
        grid_lines + line_break +
        " #{board[3]} | #{board[4]} | #{board[5]} " + line_break +
        grid_lines + line_break +
        " #{board[6]} | #{board[7]} | #{board[8]} " + line_break +
        line_break
        
        return board_grid
    end

    def display(message)
        print message
    end

    def get_spot_input
        spot = gets.chomp.to_i
        return spot
    end
end

