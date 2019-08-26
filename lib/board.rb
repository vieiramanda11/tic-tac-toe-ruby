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
    if @board[0] == @board[1] && @board[0] == @board[2] ||
       @board[3] == @board[4] && @board[3] == @board[5] ||
       @board[6] == @board[7] && @board[6] == @board[8]
      true
    end
  end

  def win_dig
    if @board[0] == @board[4] && @board[0] == @board[8] ||
       @board[2] == @board[4] && @board[2] == @board[6]
      true
    end
  end

  def win_ver
    if @board[0] == @board[3] && @board[0] == @board[6] ||
       @board[1] == @board[4] && @board[1] == @board[7] ||
       @board[2] == @board[5] && @board[2] == @board[8]
      true
    end
  end
end
