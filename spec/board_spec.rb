# frozen_string_literal: true

require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:board) { Board.new }

  let(:board_draw) do
    puts "\n"
    puts ' 1 | 2 | 3'
    puts '-----------'
    puts ' 4 | 5 | 6'
    puts '-----------'
    puts ' 7 | 8 | 9'
  end

  describe '#initialize' do
    it 'should initialize as Board class' do
      expect(board.class).to eql(Board)
    end

    it 'should make an array with length equals to 9' do
      expect(board.board.length).to eql(9)
    end
  end

  describe '#draw_board' do
    it 'print the board in the command line' do
      expect(board.draw_board).to eql(board_draw)
    end
  end
end
