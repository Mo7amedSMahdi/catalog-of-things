class Author
  attr_accessor :first_name, :last_name, :id, :items

  def initialize(first_name:, last_name:, id: nil)
    @id = id || Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author(self)
    @items << item unless @items.include?(item)
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'id' => @id,
      'items' => @items
    }.to_json(*args)
  end
end
