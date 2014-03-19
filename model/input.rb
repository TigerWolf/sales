class Input
  attr_accessor :data, :list_items
  def initialize(file_path)
    @data = File.open(File.dirname(File.dirname(__FILE__)) + "/data/#{file_path}").to_a
    @list_items = []
  end

  def parse_to_hash(items_line)
    keys = [:quantity, :product, :price, :type]
    hash_item = Hash[keys.zip items_line.to_a]
    hash_item[:quantity] = hash_item[:quantity].to_i
    hash_item[:price] = hash_item[:price].to_f
    hash_item[:type] = define_type_sale(hash_item[:product])
    hash_item
  end

  def parse_to_item_cart(item_hash)
    product = Product.new(item_hash[:product], item_hash[:type])
    product.category = Category.new(return_category_name(product.name))
    ItemCart.new(item_hash, product)
  end

  def list_items
    @data.each do |data|
      hash = parse_to_hash data.split(',')
      @list_items << parse_to_item_cart(hash)
    end
    @list_items
  end
  def define_type_sale(product)
    (product.include?"imported") ? "imported" : "basic"
  end
  def return_category_name(product_name)
    case product_name
    when /chocolate/
      "food"
    when /pills/
      "medical"
    when /book/
      "book"
    else
      "others"
    end
  end
end
