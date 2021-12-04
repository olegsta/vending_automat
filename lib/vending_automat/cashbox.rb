# frozen_string_literal: true

module VendingAutomat
  class Cashbox
    attr_reader :coins

    def initialize
      @coins = generate_coins
    end

    def deposit(coins_inserted: [])
      coins_inserted.each { |coin| coins[coin.value] << coin }
    end

    def dispense_change(amount:)
      change_in_coins = change_to_coins(amount: amount)
      return if change_in_coins.nil?

      transact(change: change_in_coins)
    end

    def calculate_change(paid:, price:)
      (paid - price).round(2)
    end

    def reload(value:)
      coins[value] << Coin.new(value: value) if Coin::VALID_COINS.include?(value)
    end

    def coins_in_cashbox
      coins.map { |value, coins_list| { value: value, quantity: coins_list.length } }
           .sort_by { |coin| coin[:value] }
           .reverse
    end

    private

    def generate_coins
      Coin::VALID_COINS.map do |value|
        [value, Array.new(5, Coin.new(value: value))]
      end.to_h
    end

    def change_to_coins(amount:)
      change = {}
      remaining_change = amount
      coins_in_cashbox.each do |coin|
        value = coin[:value]
        quantity = coin[:quantity]
        next if value > remaining_change

        count, remainder = remaining_change.divmod(value)
        change[value] = count if count.positive? && quantity.positive?
        remaining_change = remainder.round(2)
        break if remaining_change.zero?
      end
      remaining_change.zero? ? change : nil
    end

    def transact(change:)
      change.map { |value, quantity| coins[value].pop(quantity) }.flatten
    end
  end
end
