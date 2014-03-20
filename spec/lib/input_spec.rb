require "spec_helper"

describe Input do
  let(:input) {Input.new("input1.txt")}
  it "should opens a input file" do
    input.data.should have(3).items
  end
  it { input.data.class.should == Array }
  it "should parse array into hash " do
    item_cart = input.parse_to_hash(input.data[0].split(','))
    item_cart[:product].gsub!(/\s+/,"").should eql "book"
  end
  it "should parse hash into item cart " do
    item_hash = input.parse_to_hash(input.data[0].split(','))
    item_cart = input.parse_to_item_cart(item_hash)
  end
  it "should return all items from input as item_cart" do
    items = input.list_items
    items.should have(3).items
  end
end
