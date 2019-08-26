# frozen_string_literal: true

require_relative 'player.rb'
require_relative 'board.rb'

# Game class
class Game
  attr_reader :board_game, :player1, :player2, :symbol1, :symbol2

  def initialize
    @input = PlayerInput.new
    @board_game = Board.new
    @current_player = @player1
    @symbol1 = 'X'
    @symbol2 = 'O'
    @end_round = false
  end

  def players(first, second)
    @player1 = Player.new(first, @symbol1)
    @player2 = Player.new(second, @symbol2)
  end

  def change_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def player_message
    if @current_player == @player1
      puts "#{@player1.player} Choose a number between 1 and 9 to put your symbol."
    else
      puts "#{@player2.player} Choose a number between 1 and 9 to put your symbol."
    end
  end

  def player_move
    while @end_round == false
      player_message
      if @current_player == @player1
        @player_input = @input.player_input
        if @board_game.board[@player_input].is_a?(Integer)
          @board_game.board[@player_input] = @player1.symbol
          @end_round = true
        end
      else
        @player_input = @input.player_input
        if @board_game.board[@player_input].is_a?(Integer)
          @board_game.board[@player_input] = @player2.symbol
          @end_round = true
        end
      end
    end
    change_player
    @board_game.draw_board
    @end_round = false
  end

  def draw?
    true if @board_game.board.none? { |idx| idx.is_a?(Integer) }
  end

  def win?
    true if @board_game.win_dig || @board_game.win_ver || @board_game.win_hor
  end

  def winner
    @current_player == @player1 ? @player2.player : @player1.player
  end
end
