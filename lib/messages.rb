class Message

    TTT_MESSAGES = {
      welcome: "Welcome to Tic Tac Toe!\n\n",
      instructions: "Tic Tac Toe is a two player game played\non a 3 x 3 grid. When prompted, each\nplayer will place their mark by entering\na number between 1-9 that corresponds with\nan available square on the grid.",
      get_spot: "Please select an available spot between 1-9:\n",
      invalid_input: "That's not a valid spot.\n",
      X_win: "Congratulations player X, you have won!\n",
      O_win: "Congratulations player O, you have won!\n",
      draw: "It's a draw!"
    }.freeze

  def initialize(messages=nil)
    messages ||= TTT_MESSAGES
    @messages = messages
  end

  def lookup(message)
    raise ArgumentError, "Message does not exist" unless @messages.has_key?(message) 

    @messages[message]
  end
end
