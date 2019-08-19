# frozen_string_literal: true

require_relative 'player.rb'
require_relative 'board.rb'

# Game class
class Game
  attr_reader :board_game, :player1, :player2
  attr_accessor :symbol1, :symbol2
    
  def initialize
    @board_game = Board.new
    @current_player = @player1
    @symbol1 = ''
    @symbol2 = ''
  end

  def players(first, second)
    @player1 = Player.new(first, @symbol1)
    @player2 = Player.new(second, @symbol2)
  end

  def change_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end