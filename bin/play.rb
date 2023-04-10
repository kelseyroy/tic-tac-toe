#!/usr/bin/env ruby
require './lib/tic_tac_toe.rb'

board = Board.new
game = TicTacToe.new(board)
game.play

