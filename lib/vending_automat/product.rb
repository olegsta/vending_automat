# frozen_string_literal: true

module VendingAutomat
  class Product
    PROMPT = TTY::Prompt.new(symbols: { marker: '===>' }, interrupt: :exit)

    attr_reader :name, :price

    def initialize(name:, price:)
      @name = name
      @price = price
    end

    class << self
      def product_and_change(product:, change:)
        PROMPT.ok("It's your: #{product.name}")
        unless change.nil?
          breakdown = change.map do |coin|
            prefix = '$' if coin.value >= 1
            suffix = 'cent' if coin.value < 1
            "#{prefix unless prefix.nil?}#{'%.2f' % coin.value}#{suffix unless suffix.nil?}"
          end.join(', ')

          total = change.map(&:value).inject(0, &:+)
          PROMPT.ok("and your change of $#{'%.2f' % total}, coins: [#{breakdown}]")
        end
      end

      def product_options(list:)
        product_list = list.map { |item| item_details(item: item) }
        product_list << { name: 'back', value: nil }
        PROMPT.select('Select product', product_list)
      end

      def select_product_to_add(list:)
        product_list = list.map { |item| item_details(item: item) }
        product_list << { name: 'back', value: nil }
        PROMPT.select('Select product to add', product_list)
      end

      def item_details(item:)
        {
          name: "#{item[:product].name} $#{'%.2f' % item[:product].price}, quantity: #{item[:quantity]}",
          value: item
        }
      end
    end
  end
end
