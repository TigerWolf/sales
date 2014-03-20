require "./lib/input"
require "./lib/print"
require "./lib/basic_tax"
require "./model/product"
require "./model/cart"
require "./model/category"
require "./model/item_cart"
require "./service/cart_calculator"
require "bigdecimal"
require "csv"

class Main
  def initialize(input_path_name)
    @file_name = input_path_name
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
    @printer.create_output_file(@file_name)
    @printer.print
  end

  def exec
    load_input
    shopping
    print
  end
end

input_path_name = ARGV.first
cart_shopping = Main.new(input_path_name)
cart_shopping.exec
