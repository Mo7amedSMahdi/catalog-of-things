require './item'
class MusicAlbum < item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, archived: false)
    super(publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end
end
