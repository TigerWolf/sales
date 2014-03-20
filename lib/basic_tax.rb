class BasicTax
  def amount_tax
    0.10
  end
end
module BasicExempt
  def amount_tax
    0.0
  end
end
module Import
  def amount_tax
    super + 0.05
  end
end

module ImportExempt
  def amount_tax
    0.05
  end
end