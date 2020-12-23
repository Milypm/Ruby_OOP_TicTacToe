require_relative '../lib/game'

describe Game do
  
  describe '#initialize' do
    it 'create empty board (array)' do
      game = Game.new
      expect(game.board.instance_of? Array).to be_truthy
    end
  end

  describe '#reset_board' do
    it 'fill board (array) with nums (1-9)' do
      game = Game.new
      game.reset_board
      expect(game.board).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe '#choice_valid?' do
    it 'return true when passing a valid string' do
      game = Game.new
      expect(game.choice_valid?(1)).to be_falsy
    end

    it 'return true when passing a valid string' do
      game = Game.new
      expect(game.choice_valid?('1')).to be_truthy
    end
  end
end
