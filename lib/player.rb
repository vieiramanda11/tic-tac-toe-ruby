# frozen_string_literal: true

# Player's class
class Player
  attr_reader :player, :symbol
  def initialize(player, symbol)
    @player = player
    @symbol = symbol
  end
end

# Player Input class
class PlayerInput
  def player_input
    @player_input = gets.chomp.to_i - 1
    if @player_input >= 0
      @player_input = @player_input
    else
      puts 'Choose a positive number'
      @player_input = gets.chomp.to_i - 1
    end
  end
end
