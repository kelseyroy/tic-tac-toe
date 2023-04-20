class Message
  TTT_MESSAGES = {
    welcome: "Welcome to Tic Tac Toe!\n\n",
    instructions: "Tic Tac Toe is a two player game played\non a 3 x 3 grid. When prompted, each\nplayer will place their mark by entering\na number between 1-9 that corresponds with\nan available square on the grid.\n\nPlayer X goes first.\n",
    X_get_spot: "Player X, enter an available spot between 1-9:\n",
    O_get_spot: "Player O, enter an available spot between 1-9:\n",
    invalid_input: "That's not a valid spot.\n",
    X_win: "Congratulations player X, you have won!\n",
    O_win: "Congratulations player O, you have won!\n",
    draw: "It's a draw!\n"
  }.freeze

  def initialize(messages = nil)
    messages ||= TTT_MESSAGES
    @messages = messages
  end

  def lookup(message)
    raise ArgumentError, 'Message does not exist' unless @messages.key?(message)

    @messages[message]
  end
end
