require 'spec_helper'

describe ItemCart do
  it 'should create an item_cart' do
    product = Product.new("book", "import")
    hash = {:quantity => 1, :price => 10.5}
    item = ItemCart.new(hash, product)
    expect(item.price).to be(10.5)
  end
end
