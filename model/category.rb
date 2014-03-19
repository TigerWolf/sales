class Category
  attr_accessor :exempted, :name
  def initialize(name)
    @name = name
    @exceptions = ["book", "medical", "food"]
  end

  def exempted?
    @exceptions.include? @name
  end

  def to_s
    "#{name} - exempted?: #{exempted?} "
  end
end