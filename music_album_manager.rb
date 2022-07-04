class MusicAlbumManager
  def initialize
    @albums_list = []
  end

  def add_music_album(album)
    @albums_list.push(album) unless @albums_list.include?(album)
  end
end
