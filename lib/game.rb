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

  def player_move
    while @end_round == false
      if @current_player == @player1
        puts "#{@player1.player} Choose a number between 1 and 9 to put your symbol."
        @player_input = gets.chomp.to_i - 1
        if @board_game.board[@player_input].is_a?(Integer)
          @board_game.board[@player_input] = @player1.symbol
          @end_round = true
        end
      else
        puts "#{@player2.player} Choose a number between 1 and 9 to put your symbol."
        @player_input = gets.chomp.to_i - 1
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

  def win_hor
    if @board_game.board[0] == @board_game.board[1] && @board_game.board[0] == @board_game.board[2] ||
       @board_game.board[3] == @board_game.board[4] && @board_game.board[3] == @board_game.board[5] ||
       @board_game.board[6] == @board_game.board[7] && @board_game.board[6] == @board_game.board[8]
      true
    end
  end

  def win_dig
    if @board_game.board[0] == @board_game.board[4] && @board_game.board[0] == @board_game.board[8] ||
       @board_game.board[2] == @board_game.board[4] && @board_game.board[2] == @board_game.board[6]
      true
    end
  end

  def win_ver
    if @board_game.board[0] == @board_game.board[3] && @board_game.board[0] == @board_game.board[6] ||
       @board_game.board[1] == @board_game.board[4] && @board_game.board[1] == @board_game.board[7] ||
       @board_game.board[2] == @board_game.board[5] && @board_game.board[2] == @board_game.board[9]
      true
    end
  end

  def draw?
    false if @board_game.board.all? { |idx| idx.is_a?(Integer) }
  end

  def win?
    true if win_dig || win_ver || win_hor
  end

  def winner
    @current_player == @player1 ? @player2.player : @player1.player
  end
end
