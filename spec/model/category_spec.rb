require 'spec_helper'

describe Category do
  it 'should create a category' do
    food = Category.new("food")
    food.name.should eql "food"
  end
  it 'should create a category exempt of tax ' do
    medicine = Category.new("medical")
    medicine.exempted?.should be_true
  end
  it 'should create a category with tax ' do
    car = Category.new("vehicle")
    car.exempted?.should be_false
  end
end