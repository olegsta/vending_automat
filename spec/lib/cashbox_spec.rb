require './lib/vending_automat'

describe VendingAutomat::Cashbox do
  let(:cashbox) { described_class.new }

  describe '#initialize' do
    it 'returns initialize with value' do
      expect(cashbox.deposit).to eq([])
      expect(cashbox.dispense_change(amount: 0)).to eq([])
    end
  end
end
