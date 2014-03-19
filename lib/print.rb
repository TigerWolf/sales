class Print
  attr_accessor :cart
  HEADING = "Quantity,Product,Price"
  def initialize cart
    @cart = cart
  end

  def print(input_name)
    puts "================================="
    puts "\n#{input_name}\n\n"
    puts "================================="
    puts HEADING
    @cart.items_updated.each do |item_cart|
      puts "#{item_cart.quantity}, #{item_cart.product.name},#{item_cart.price}"
    end
    puts "\nSales Taxes: #{@cart.amount_sales_tax}"
    puts "Total: #{@cart.total}"
    puts "================================="
  end
end