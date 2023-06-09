# tic_tac_toe

Implement the classic game of tic-tac-toe as a command line application. Two human players ought to be able to compete with each other via the command line. 

## Dependencies

This game requires `Ruby 3.2.1` to play.

## Setup
1. [Clone the repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) to your local computer.
2. Use your terminal to navigate into your new tic-tac-toe folder and install project dependencies by running `bundle install`.
3. To run the CLI application, call `ruby bin/play.rb` from within the tic-tac-toe folder. Or, to mark the script as executable, run the command `chmod +x bin/play.rb` and then call `bin/play.rb` from within the tic-tac-toe folder.
4. To run the tests, call `bundle exec rspec` from within the tic-tac-toe foler.

## How to play

Tic Tac Toe is a two player game played on a 3 x 3 grid. One player will mark the grid with 'X' and the other player will mark the grid with 'O'. Each player takes turns placing their mark in the squares on the grid, with the goal of getting 3 marks in a row.

https://user-images.githubusercontent.com/89801075/233448701-7423a397-bcce-4cd4-ad25-c62d83897932.mov

To start the game, run `ruby bin/play.rb` from within the tic-tac-toe folder. 

When prompted, enter a number between 1-9 that corresponds with an available square. Then press `enter` on your keyboard to submit your selection.

Press the `ctrl + c` keys on your keyboard to quit out of the game at any time.

## Built with

* [Ruby](https://www.ruby-lang.org/)
* [Rspec](https://rspec.info/)


