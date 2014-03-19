class Cart
  attr_accessor :items, :items_updated, :total, :amount_sales_tax
  def initialize
    @items = []
    @cart_calculator = CartCalculator.new
    @items_updated = []
  end
  def add_item_cart(item_cart)
    @items << item_cart
  end
  def total_line_before_tax item_cart
    @cart_calculator.total_line_before_tax(item_cart)
  end
  def total_line_with_tax item_cart
    item_cart.price = @cart_calculator.total_line_after_tax(item_cart)
    @items_updated << item_cart
    item_cart.price.to_f
  end
  def amount_sales_tax
    @cart_calculator.amount_sales_tax.round(2)
  end
  def create_cart list_items
    list_items.each do |item|
    add_item_cart item
  end
  end
  def checkout
    @total = 0.0
    @items.each do |ic|
      @total+= total_line_with_tax(ic)
    end
    self
  end
end
