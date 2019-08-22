# frozen_string_literal: true

# Board class
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def draw_board
    puts "\n"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
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
end
