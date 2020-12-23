require_relative '../lib/game'

describe Game do
  let(:new_game) { Game.new }
  describe '#initialize' do
    it 'create empty board (array)' do
      new_game
      expect(new_game.board.instance_of? Array).to be_truthy
    end
  end
  describe '#reset_board' do
    it 'fill board (array) with nums (1-9)' do
      new_game
      new_game.reset_board
      expect(new_game.board).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end
  describe '#choice_valid?' do
    it 'return false when passing an invalid value (not string)' do
      new_game
      expect(new_game.choice_valid?(1)).to be_falsy
    end
    it "return true when passing a valid string ('1-9')" do
      new_game
      expect(new_game.choice_valid?('1')).to be_truthy
    end
    it "return false when passing an invalid string (not '1-9')" do
      new_game
      expect(new_game.choice_valid?('0')).to be_falsy
    end
  end
  describe '#get_spot' do
    it 'return the specific location (array) on the board based on the input' do
      new_game
      expect(new_game.get_spot('1')).to eql([0, 0])
    end
  end
  describe '#spot_valid?' do
    it 'return true if the spot is not equal to X or O' do
      new_game
      expect(new_game.spot_valid?([2, 1])).to be_truthy
    end
    it 'return false if the spot is equal to X or O' do
      new_game
      new_game.update_board([2, 1], 'X')
      expect(new_game.spot_valid?([2, 1])).to be_falsy
    end
  end
  describe '#update_board' do
    it 'display the symbol at the selected spot on the board' do
      new_game
      new_game.reset_board
      new_game.update_board([2, 1], 'X')
      expect(new_game.board).to eql([[1, 2, 3], [4, 5, 6], [7, 'X', 9]])
    end
    it 'display the symbol at the selected spot on the board' do
      new_game
      new_game.reset_board
      new_game.update_board([2, 1], 'O')
      expect(new_game.board).to eql([[1, 2, 3], [4, 5, 6], [7, 'O', 9]])
    end
  end
  describe '#win?' do
    it 'return true if a row/column/diagonal has equal values' do
      new_game
      new_game.reset_board
      new_game.update_board([2, 0], 'O')
      new_game.update_board([2, 1], 'O')
      new_game.update_board([2, 2], 'O')
      expect(new_game.win?).to be_truthy
    end
    it 'return true if a row/column/diagonal has equal values' do
      new_game
      new_game.reset_board
      new_game.update_board([0, 1], 'O')
      new_game.update_board([1, 1], 'O')
      new_game.update_board([2, 1], 'O')
      expect(new_game.win?).to be_truthy
    end
    it 'return true if a row/column/diagonal has equal values' do
      new_game
      new_game.reset_board
      new_game.update_board([0, 2], 'O')
      new_game.update_board([1, 1], 'O')
      new_game.update_board([2, 0], 'O')
      expect(new_game.win?).to be_truthy
    end
  end
  describe '#draw?' do
    it 'return true if no one wins and the board is full' do
      new_game
      new_game.reset_board
      new_game.update_board([0, 0], 'X')
      new_game.update_board([0, 1], 'O')
      new_game.update_board([0, 2], 'X')
      new_game.update_board([1, 0], 'O')
      new_game.update_board([1, 1], 'O')
      new_game.update_board([1, 2], 'X')
      new_game.update_board([2, 0], 'O')
      new_game.update_board([2, 1], 'X')
      new_game.update_board([2, 2], 'O')
      expect(new_game.draw?).to be_truthy
    end
    it 'return false if no one wins and the board is not full' do
      new_game
      new_game.reset_board
      new_game.update_board([0, 0], 'X')
      new_game.update_board([0, 1], 'O')
      new_game.update_board([0, 2], 'X')
      new_game.update_board([1, 0], 'O')
      new_game.update_board([1, 1], 'O')
      new_game.update_board([1, 2], 'X')
      new_game.update_board([2, 0], 'O')
      new_game.update_board([2, 1], 'X')
      expect(new_game.draw?).to be_falsy
    end
    it 'return false if someone wins' do
      new_game
      new_game.reset_board
      new_game.update_board([0, 0], 'X')
      new_game.update_board([0, 1], 'X')
      new_game.update_board([0, 2], 'X')
      expect(new_game.draw?).to be_falsy
    end
  end
end
