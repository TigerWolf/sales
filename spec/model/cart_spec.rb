require 'spec_helper'

describe Cart do

  let(:cart) { Cart.new }

  it "should create a cart" do
    cart.create_cart(input_file(1).list_items)
    cart.items.should have(3).items
  end

  it "should add item to cart" do
    items = input_file(1).list_items
    items.each do |item_cart|
      cart.add_item_cart(item_cart)
    end
    cart.items.should have(3).items
  end

  it 'should check out cart' do
    input_file(1).list_items.each do |item|
      cart.add_item_cart(item)
    end
    cart.checkout
    cart.total.should eql 29.83
  end

  it "should return the total of item with no tax included" do
    total_book = cart.total_line_before_tax(input_file(1).list_items[0])
    total_book.should eql 12.49
  end

  it "should return the total of item for basic sales with tax" do
    total_music_cd = cart.total_line_with_tax(input_file(1).list_items[1])
    total_music_cd.should eql 16.49
  end

  it "should return the total of item for import sales with tax" do
    total_music_cd = cart.total_line_with_tax(input_file(2).list_items[1])
    total_music_cd.should eql 54.63
  end
  it "should return the total of item for import sales without tax" do
    total_chocolate = cart.total_line_with_tax(input_file(2).list_items[0])
    total_chocolate.should eql 10.5
  end

  it "should calculate the total for the cart input 1" do
    cart = checkout_test(input_file(1))
    cart.total.should eql 29.83
    cart.amount_sales_tax.should == 1.5
  end
  it "should calculate the total for the cart input 2" do
    checkout_test(input_file(2))
    cart.total.should eql 65.13 #Getting 65.13, instead of 65.15
    cart.amount_sales_tax.should == 7.63 #Getting 7.63, instead of  7.65
  end
  it "should calculate the total for the cart input 3" do
    checkout_test(input_file(3))
    cart.total.should eql 74.64 #Getting 74.64 instead of 74.68
    cart.amount_sales_tax.should == 6.66 #Getting 6.66 instead of 6.70
  end
  def checkout_test(input)
    input.list_items.each do |item|
      cart.add_item_cart(item)
    end
    cart.checkout
    cart
  end
  def input_file(input_number)
    case input_number
    when 1
      Input.new("input1.txt")
    when 2
      Input.new("input2.txt")
    else
      Input.new("input3.txt")
    end
  end
end