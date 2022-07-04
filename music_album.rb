require "./item"
class MusicAlbum < item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(id: nil, publish_date:, archived: false)
    super(publish_date: publish_date, archived: archived, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
