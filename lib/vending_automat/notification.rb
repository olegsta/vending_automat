# frozen_string_literal: true

module VendingAutomat
  module Notification
    def goodbye_message
      puts 'Goodbay'.green
    end

    def welcome_message
      puts 'Welcome to the Vending Machine'.green
    end

    def product_unavailable
      puts 'Product unavailable. Please choose again'.red
    end

    def transaction_failed
      puts 'Failed to transact payment. Please try again'.red
    end

    def insert_coins(product:)
      puts "Selected #{product.name}. Please pay $#{'%.2f' % product.price}".green
    end

    def total_payment(total:)
      puts "Total amount of coins paid: $#{'%.2f' % total}".green
    end

    def more_coins(paid:, remaining:)
      puts "Paid $#{'%.2f' % paid}.".green
      puts "$#{'%.2f' % remaining} remaining".blue
    end
  end
end
