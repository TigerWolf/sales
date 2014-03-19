require 'spec_helper'

describe Print do
  subject(:cart) { create_cart(Input.new("input1.txt")) }
  subject(:printer) { Print.new(cart) }

  it 'create the output_name file' do
    output_file = printer.return_output_name("input1.txt")
    expect(output_file).to eq("output1.csv")
  end
  it 'creates an output file' do
    output_file = printer.create_output_file("input1.txt")
    puts output_file.inspect
    # expect(output_file.inspect).to include "./data/output"
  end
  it 'prints the output at the stdout' do
    output_file = printer.create_output_file("input1.txt")
    printer.print
  end

  def create_cart(input)
    cart = Cart.new
    cart.create_cart(input.list_items)
    cart.checkout
  end
end
