# frozen_string_literal: true

module VendingAutomat
  class Display
    PROMPT = TTY::Prompt.new(symbols: { marker: '===>' }, interrupt: :exit)

    def self.menu
      options = [
        { name: 'Machine', value: 1 },
        { name: 'Insert Products', value: 2 },
        { name: 'Insert Coins', value: 3 },
        { name: 'Quit', value: nil }
      ]
      PROMPT.select('Pick a mode', options)
    end
  end
end
