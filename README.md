# VendingAutomat

![Gem](https://img.shields.io/gem/v/vending_automat)
[![Build Status](https://travis-ci.com/olegsta/vending_automat.svg?branch=master)](https://travis-ci.com/github/olegsta/vendding_a)
[![Test Coverage](https://codecov.io/gh/olegsta/vending_automat/branch/master/graph/badge.svg)](https://codecov.io/gh/olegsta/vending_automat)

### Prerequisites
Ruby 2.7.2 is required for the project.

### Installation
Clone or download project.

Install Gem dependencies.
```
bundle install
```

### To start:
```
require "vending_automat"

ruby VendingAutomat::VendingMachine.run
```

# Vending Machine
Vending machine has such menus:

![Alt text](/images/welcome.png)

We can insert coins:

![Alt text](/images/add_coin1.png)
![Alt text](/images/add_coin2.png)

We can insert products:

![Alt text](/images/add_products1.png)

![Alt text](/images/add_products2.png)


We can buy products:

![Alt text](/images/bye_products1.png)
![Alt text](/images/bye_products2.png)

### Entry Point & Initialization
The vending machine entry point is main.rb

Initialized with the following products in inventory:
Product Name | Price | Quantity
------------ | ----- | --------
Coca Cola    | 2.00  | 2
Sprite       | 2.50  | 2
Fanta        | 2.70  | 3
Orange Juice | 3.00  | 1
Water        | 3.25  | 0

Initialized with the following coins in cashbox:
Value | Quantity
----- | --------
2.00  | 5
1.00  | 5
0.50  | 5
0.20  | 5
0.10  | 5
0.05  | 5
0.02  | 5
0.01  | 5

## Built With
- Ruby 2.7.2
- RSpec
- Pry
- Colorize
- Rubocop
- tty-prompt
