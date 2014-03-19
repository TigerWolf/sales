class CartCalculator
  attr_accessor :amount_sales_tax, :amount_sales_total

  BASIC = "basic"
  IMPORTED = "import"

  def initialize
    @total_line_before_tax = 0.0
    @amount_sales_tax = 0.0
    @amount_sales_total = 0.0
  end

  def total_line_before_tax(item_cart)
    item_cart.quantity * item_cart.price if item_cart
  end
   def round_to(amount)
    a = BigDecimal.new(amount.to_s)
    a.mult(1, 2)
    a.add(0, 4)
  end
  def total_line_after_tax(item)
    tax_amount = tax_to_be_applyed(item.product)
    before_tax = total_line_before_tax(item)
    if tax_amount != 0.0
      total = before_tax + (before_tax * tax_amount)
      total = round_to(total)
      @amount_sales_tax+= (total-before_tax)
    else
      total = before_tax
    end
    @amount_sales_total+= total
    total.to_f
  end

  def tax_to_be_applyed(product)
    tax = BasicTax.new
    if product.type.include? BASIC
        tax.extend(BasicExempt) if product.category.exempted?
    end
    if product.type.include? IMPORTED
        (product.category.exempted?) ? tax.extend(ImportExempt) : tax.extend(Import)
    end
    tax.amount_tax
  end
end
