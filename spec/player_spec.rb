# frozen_string_literal: true

require_relative '../lib/player.rb'

# Testing player class
RSpec.describe Player do
  let(:name) { 'Amanda' }
  let(:symbol) { 'X' }
  let(:player) { Player.new('Amanda', 'X') }

  context "#initialize" do
    it "when initialize the name should match" do
      expect(player.player).to eql(name)
    end

    it "when initialize the symbol should match" do
      expect(player.symbol).to eql(symbol)
    end
  end
end

# Testing input_player class
=begin
RSpec.describe PlayerInput do
  describe "#player_input" do
    let(:player_input) { PlayerInput.new }
    it "should return the message" do
      allow(player_input.player_input).to receive(-5)
      expect(player_input.player_input).to eql('Choose a positive number')
    end
  end
end
=end