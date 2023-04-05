class Message

    TTT_MESSAGES = {
      welcome: "Welcome to Tic Tac Toe!\n\n",
      instructions: "Tic Tac Toe is a two player game played\non a 3 x 3 grid. When prompted, each\nplayer will place their mark by entering\na number between 1-9 that corresponds with\nan available square on the grid."
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
