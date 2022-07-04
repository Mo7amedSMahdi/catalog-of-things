class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name:, id: nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_genre(self)
    @items.push(item) unless @items.include?(item)
  end
end
