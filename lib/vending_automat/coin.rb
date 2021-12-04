# frozen_string_literal: true

module VendingAutomat
  class Coin
    PROMPT = TTY::Prompt.new(symbols: { marker: '===>' }, interrupt: :exit)

    VALID_COINS = [2.00, 1.00, 0.50, 0.20, 0.10, 0.05, 0.02, 0.01].freeze
    DEFAULT_COINS = [
      { name: '$2', value: 2.00 },
      { name: '$1', value: 1.00 },
      { name: '50 cent', value: 0.50 },
      { name: '20 cent', value: 0.20 },
      { name: '10 cent', value: 0.10 },
      { name: '5 cent', value: 0.05 },
      { name: '2 cent', value: 0.02 },
      { name: '1 cent', value: 0.01 }
    ].freeze

    attr_reader :value

    def initialize(value:)
      @value = value
    end

    def self.coin_options
      PROMPT.select('Insert a coin', DEFAULT_COINS)
    end

    def self.select_coin_to_reload(coin_list:)
      coins = coin_list.map do |coin|
        { name: "#{coin[:value]}, quantity in cashbox: #{coin[:quantity]}", value: coin[:value] }
      end
      coins << { name: 'back', value: nil }
      PROMPT.select('Insert a coin to reload', coins)
    end
  end
end
