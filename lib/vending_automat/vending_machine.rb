# frozen_string_literal: true

require_relative 'notification'

module VendingAutomat
  class VendingMachine
    extend Notification

    def initialize
      @inventory = Inventory.new
      @cashbox = Cashbox.new
      @coins_inserted = []
      @item_selected = nil
    end

    def self.run
      new.start
    end

    def start
      VendingMachine.welcome_message
      loop do
        option = Display.menu
        case option
        when 1
          order_menu
          next if item_selected.nil?

          pay(product: item_selected[:product])
          vend
        when 2
          insert_inventory_menu
        when 3
          insert_coin_menu
        else
          VendingMachine.goodbye_message
          exit
        end
      end
      VendingMachine.goodbye_message
    end

    private

    attr_accessor :coins_inserted, :item_selected
    attr_reader :inventory, :cashbox, :display

    def vend
      change = cashbox.calculate_change(paid: sum_coins_inserted, price: item_selected[:product].price)
      if change.positive?
        change_in_coins = cashbox.dispense_change(amount: change)
        return VendingMachine.transaction_failed if change_in_coins.nil?
      end

      product_purchased = inventory.dispense_product(code: item_selected[:code])
      Product.product_and_change(product: product_purchased, change: change_in_coins)
      reset
    end

    def order_menu
      product_list = inventory.product_listing
      self.item_selected = Product.product_options(list: product_list)
      return if item_selected.nil?

      if inventory.product_unavailable?(code: item_selected[:code])
        VendingMachine.product_unavailable
        reset
      end
    end

    def pay(product:)
      VendingMachine.insert_coins(product: product)
      until sum_coins_inserted >= product.price
        remaining_to_pay = product.price - sum_coins_inserted
        VendingMachine.more_coins(paid: sum_coins_inserted, remaining: remaining_to_pay)
        coin_value = Coin.coin_options
        insert_coin(value: coin_value)
      end
      cashbox.deposit(coins_inserted: coins_inserted)
      VendingMachine.total_payment(total: sum_coins_inserted)
    end

    def insert_coin(value:)
      coins_inserted << Coin.new(value: value)
    end

    def sum_coins_inserted
      coins_inserted.map(&:value).inject(0, &:+)
    end

    def reset
      self.coins_inserted = []
      self.item_selected = nil
    end

    def insert_inventory_menu
      item = Product.select_product_to_add(list: inventory.product_listing)
      return if item.nil?

      inventory.reload(code: item[:code])
    end

    def insert_coin_menu
      value = Coin.select_coin_to_reload(coin_list: cashbox.coins_in_cashbox)
      return if value.nil?

      cashbox.reload(value: value)
    end
  end
end
