# frozen_string_literal: true

# Player's class
class Player
  attr_reader :player, :symbol
  def initialize(player, symbol)
    @player = player
    @symbol = symbol
  end
end
