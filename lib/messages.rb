class Message

  def initialize
    @messages = {
      welcome: "Welcome to Tic Tac Toe!",
      instructions: "Tic Tac Toe is a two player game played on a 3 x 3 grid.  When prompted, each player will place their mark by entering a number between 1-9 that corresponds with an available square on the grid."
    }
  end

  def lookup(message)
    raise ArgumentError, "Message does not exist" unless @messages.has_key?(message) 

    @messages[message]
  end
end
