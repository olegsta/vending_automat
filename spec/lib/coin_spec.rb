require 'spec_helper'
require './lib/vending_automat'

describe VendingAutomat::Coin do
  let(:coin) { described_class.new(value: 2.00) }

  describe '#initialize' do
    it 'returns initialize with value' do
      expect(coin).to have_attributes(:value => 2.00)
    end
  end
end
