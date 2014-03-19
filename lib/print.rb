class Print
  attr_accessor :cart, :output_name
  HEADING = "Quantity|Product|Price"
  def initialize cart
    @cart = cart
  end
  def create_output_file(input_filename)
    @output_name = return_output_name(input_filename)
    output_number = @output_name.scan(/\d/).join()
    CSV.open("./data/#{output_name}", "w") do |row|
      row << []
      row << ["Output #{output_number}"]
      row << ["================================="]
      row << [HEADING]
      row << ["================================="]
      @cart.items_updated.each do |item_cart|
        row << ["#{item_cart.quantity}, #{item_cart.product.name},#{item_cart.price}"]
      end
      row << ["_________________________________"]
      row << ["Sales Taxes: #{@cart.amount_sales_tax}"]
      row << ["Total: #{@cart.total}"]
      row << ["================================="]
      row
    end
  end
  def print
    CSV.foreach("./data/#{@output_name}") do |row|
      puts row
    end
  end
  def return_output_name(input_name)
    output_name = input_name.sub('in', 'out')
    output_name.sub('txt', 'csv')
  end
end
