require_relative 'messages'

class UserInterface
    def initialize
        @message = Message.new
    end

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

    private

    def valid_spot?(spot)
        (1..9).to_a.include?(spot)
    end
end

