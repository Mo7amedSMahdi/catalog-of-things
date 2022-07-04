class Genre
  def initialize(name:, id: nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items.push(item) unless @items.include?(item)
  end
end
