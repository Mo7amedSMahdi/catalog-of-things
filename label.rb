class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color, id)
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def add_item(item); end
end
