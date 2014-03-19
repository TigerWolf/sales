require 'spec_helper'

describe Product do

  it 'should create a Product' do
    book = Product.new("book", "basic")
    book.name.should eql "book"
    book.type.should eql "basic"
  end
  it 'should be able to set values for name' do
    book = Product.new("book", "basic")
    book.name = "book 2"
    book.type = "import"
    book.name.should eql "book 2"
    book.type.should eql "import"
  end
end