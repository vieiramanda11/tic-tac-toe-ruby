# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

game = Game.new

puts 'Welcome to Tic Tac Toe game!'
puts 'Player 1 write your name: '
first = gets.chomp.capitalize!
puts "#{first} your symbol is X"
game.symbol1 = 'X'

puts 'Player 2 write your name: '
second = gets.chomp.capitalize!
puts "#{second} your symbol is O"
game.symbol2 = 'O'

game.players(first, second)

game.board_game.draw_board

game.player_move until game.win? || game.draw?

if game.win?
  puts "#{game.winner} congratulations, you won the game!"
else
  puts 'Too bad. It\'s a draw.'
end

puts 'Thank you for playing.'
