require 'spec_helper'
require './lib/vending_automat'

describe VendingAutomat::Product do
  let(:product) { described_class.new(name: 'Coca Cola', price: 2.00) }

  describe '#initialize' do
    it 'returns initialize product with name, price, code' do
      expect(product).to have_attributes(:name => 'Coca Cola', :price => 2.00)
    end
  end
end
