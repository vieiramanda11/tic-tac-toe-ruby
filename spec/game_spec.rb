# frozen_string_literal: true

require_relative '../lib/game.rb'

RSpec.describe Game do
  let(:game) { Game.new }

  describe "#win?" do
    it "should return true when the first row of the board is filled with the same symbol" do
      game.board_game.board = ['O','O', 'O', '4', '5', '6', '7', '8', '9']
      expect(game.win?).to eql(true)
    end
    it "should return true when the second row of the board is filled with the same symbol" do
      game.board_game.board = ['1','2', '3', 'X', 'X', 'X', '7', '8', '9']
      expect(game.win?).to eql(true)
    end
    it "should return true when the third row of the board is filled with the same symbol" do
      game.board_game.board = ['1','2', '3', '4', '5', '6', 'O', 'O', 'O']
      expect(game.win?).to eql(true)
    end
    it "should return true when the first column of the board is filled with the same symbol" do
      game.board_game.board = ['O', '2', '3', 'O', '5', '6', 'O', '8', '9']
      expect(game.win?).to eql(true)
    end
    it "should return true when the second column of the board is filled with the same symbol" do
      game.board_game.board = ['1', 'X', '3', '4', 'X', '6', '7', 'X', '9']
      expect(game.win?).to eql(true)
    end
    it "should return true when the third column of the board is filled with the same symbol" do
      game.board_game.board = ['1', '2', 'X', '4', '5', 'X', '7', '8', 'X']
      expect(game.win?).to eql(true)
    end
    it "should return true when the first diagonal of the board is filled with the same symbol" do
      game.board_game.board = ['O', '2', '3', '4', 'O', '6', '7', '8', 'O']
      expect(game.win?).to eql(true)
    end
    it "should return true when the first diagonal of the board is filled with the same symbol" do
      game.board_game.board = ['O', '2', 'X', '4', 'X', '6', 'X', '8', '9']
      expect(game.win?).to eql(true)
    end
  end
  describe "draw?" do
    it "should return true when the game is a draw" do
      game.board_game.board = ['O', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O']
      expect(game.draw?).to eql(true)
    end
  end
end