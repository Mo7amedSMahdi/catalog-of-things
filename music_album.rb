require './item'
class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, on_spotify:, id: nil, archived: false)
    super(publish_date: publish_date, archived: archived, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
