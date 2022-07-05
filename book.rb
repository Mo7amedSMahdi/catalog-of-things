class Book < Item
  attr_accessor :publisher, :cover_be_archived, :author, publish_date, :label

  def initialize(publisher, cover_be_archived, author, publish_date, label, id)
    super(publish_date, author, label, id)
    @publisher = publisher
    @cover_be_archived = cover_be_archived
  end

  def can_be_archived?; end
end
