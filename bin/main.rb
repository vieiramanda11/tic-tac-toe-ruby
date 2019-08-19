# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

game = Game.new

puts 'Welcome to Tic Tac Toe game!'
puts 'Player 1 write your name: '
first = gets.chomp

until game.symbol1 == 'X' || game.symbol1 == 'O'
  puts 'Choose your symbol: '
  symbol1 = gets.chomp.upcase!
end

game.symbol2 = game.symbol1 == 'X' ? 'O' : 'X'

puts 'Player 2 write your name: '
second = gets.chomp

game.players(first, second)

game.board_game.draw_board
