class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color, _items)
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def add_item(item)
    item.add_label(self)
    @items.push(item) unless @items.include?(item)
  end
end
