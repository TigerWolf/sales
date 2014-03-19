require 'spec_helper'

describe Print do
    it 'should print the cart do input1' do
      cart = create_cart(Input.new("input1.txt"))
      printer = Print.new(cart)
      printer.print("Input 1")
    end
    it 'should print the cart do input2' do
      cart = create_cart(Input.new("input2.txt"))
      printer = Print.new(cart)
      printer.print("Input 2")
    end
    it 'should print the cart do input3' do
      cart = create_cart(Input.new("input3.txt"))
      printer = Print.new(cart)
      printer.print("Input 3")
    end

    def create_cart(input)
      cart = Cart.new
      cart.create_cart(input.list_items)
      cart.checkout
      cart
    end
end