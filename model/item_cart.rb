class ItemCart
  attr_accessor :quantity, :price, :product
  def initialize(item_hash, product)
    @quantity = item_hash[:quantity]
    @price = item_hash[:price]
    @product = product
  end
end