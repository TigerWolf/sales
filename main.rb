require "./lib/input"
require "./lib/print"
require "./lib/basic_tax"
require "./model/product"
require "./model/cart"
require "./model/category"
require "./model/item_cart"
require "./service/cart_calculator"
require "bigdecimal"

class Main
  def initialize(file_name)
    @file_name = file_name
  end

  def load_input
    @input = Input.new(@file_name)
  end

  def shopping
    @cart = Cart.new
    @cart.create_cart(@input.list_items)
    @cart.checkout
  end

  def print
    @printer = Print.new(@cart)
    @printer.print(@file_name)
  end

  def exec
    load_input
    shopping
    print
  end
end

path_name = ARGV.first
cart_shopping = Main.new(path_name)
cart_shopping.exec