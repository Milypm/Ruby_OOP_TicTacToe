require_relative '../lib/player'

describe Player do
  let(:name) { 'Nick' }
  let(:player_1) { Player.new(name, 'X') }
  let(:player_2) { Player.new(name, 'O') }
  describe '#initialize' do
    it 'set the name for player' do
      expect(player_1.name).to eql('Nick')
    end
    it 'set the symbol for player one' do
      expect(player_1.symbol).to eql('X')
    end
    it 'set the symbol for player two' do
      expect(player_2.symbol).to eql('O')
    end
  end
end
