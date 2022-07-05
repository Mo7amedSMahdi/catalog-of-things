class Book < Item
  attr_accessor :publisher, :cover_state, publish_date

  def initialize(publisher:, cover_state:, publish_date:, id: nil, archived: false)
    super(publish_date: publish_date, id: id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?; end
end
