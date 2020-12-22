

describe Game do
  
  describe '#initialize' do
    it 'create empty board (array)' do
      expect(initialize.board).to eql(Array.new(3) { Array.new(3) })
    end
  end

  describe '#reset_board' do
    it 'fill board (array) with nums (1-9)' do
      expect(reset_board(rest_board)).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  # describe '#choice_valid?' do
  #   it 'fill board (array) with nums (1-9)' do
  #     expect(choice_valid?(rest_board)).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  #   end
  # end
end
