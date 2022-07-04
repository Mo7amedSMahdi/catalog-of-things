class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date:, archived: false, id:)
    @id = id || Random.rand(1..1_000_000)
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    retrun true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    gener.items.push(self) unless genre.items.include?(self)
  end

  private

  def can_be_archived?
    @publish_date > 10
  end
end
