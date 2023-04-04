class Message

  def welcome
    return "Welcome to Tic Tac Toe!"  
  end

  def instructions
   return "Tic Tac Toe is a two player game played on a 3 x 3 grid.  When prompted, each player will place their mark by entering a number between 1-9 that corresponds with an available square on the grid."
  end

  def player_prompt(player_mark)
    return "#{player_mark}'s turn! Please enter an available space between 1-9:"
  end

  def start_game
    puts welcome
    puts instructions
    puts player_prompt('X')
  end

  def game_over(player_mark)
    return "Game Over, #{player_mark} got three in a row!"
  end
end
