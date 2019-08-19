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
    @end_round = false
  end

  def players(first, second)
    @player1 = Player.new(first, @symbol1)
    @player2 = Player.new(second, @symbol2)
  end

  def change_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def player_move
    until @end_round
      if @current_player == @player1
        puts '#{@player1.name} Pick a place in the border choosing a number between 1 and 9 to put your symbol'
        @player_input = gets.chomp.to_i
        @player_input -= 1
        if @board_game.board[@player_input].is_a? Integer
          @board_game.board[@player_input] = @player1.symbol
          @end_round = true
        end
      else
        puts '#{@player2.name} Pick a place in the border choosing a number between 1 and 9 to put your symbol'
        @player_input = gets.chomp.to_i
        @player_input -= 1
        if @board_game.board[@player_input].is_a? Integer
          @board_game.board[player_input] = @player2.symbol
          @end_round = true
        end 
      end
    end
    change_player
    @board_game.draw_board
    @board_game.legend
    @end_round = false 
  end

  def win_conditions
    if @board_game.board[0] == @board_game.board[1] && @board_game.board[0] == @board_game.board[2]
       @board_game.board[3] == @board_game.board[4] && @board_game.board[3] == @board_game.board[5]
       @board_game.board[6] == @board_game.board[7] && @board_game.board[6] == @board_game.board[8]
       @board_game.board[0] == @board_game.board[3] && @board_game.board[0] == @board_game.board[6]
       @board_game.board[1] == @board_game.board[4] && @board_game.board[1] == @board_game.board[7]
       @board_game.board[2] == @board_game.board[5] && @board_game.board[2] == @board_game.board[9]
       @board_game.board[0] == @board_game.board[4] && @board_game.board[0] == @board_game.board[8]
       @board_game.board[2] == @board_game.board[4] && @board_game.board[2] == @board_game.board[6]
  end
end