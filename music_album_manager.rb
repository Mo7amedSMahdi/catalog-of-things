class MusicAlbumManager
  def initialize
    @albums_list = []
  end

  def add_music_album(album)
    @albums_list.push(album) unless @albums_list.include?(album)
  end

  def create_music_album(genre_manager)
    puts "##################################"
    puts "###### Creating Music Album ######"
    puts "##################################"
    puts "Enter publish date (YYYY-MM-DD):"
    date = Date.parse(gets.chomp)
    puts "Is it on spotify? [Y,N]"
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == "y" ? true : false
    puts "Is it archived? [Y,N]"
    archived = gets.chomp.downcase
    archived = archived == "y" ? true : false
    music_album = MusicAlbum.new(publish_date: date, on_spotify: on_spotify)
    if archived
      music_album.move_to_archive
      puts "It wasn't possible to archive this Music Album" if music_album.archived == false
    end
    puts "1) Create a new genre to use \n2) List and use an existing genre\n3) Create without genre"
    option = gets.chomp
    genre = prompt_genre(option, genre_handler)
    music_album.add_genre(genre)
    genre_handler.add_genre(genre) unless genre_handler.genres.include?(genre)
    @music_albums.push(music_album)
    puts "Music Album created!"
    puts "************************************"
    puts "******* Music Album created! *******"
    puts "************************************"
  end

  def prompt_genre(option, genre_handler)
    case option
    when "1"
      genre_handler.create_genre
    when "2"
      genre_handler.list_genre_with_index
      genre_index = gets.chomp.to_i
      genre = genre_handler.get_genre_from_index(genre_index)
      puts "No genre found with index #{genre_index}" if genre.nil?
      genre
    when "3"
      puts "Creating Music Album without genre"
      nil
    else
      puts "Invalid option, aborting genre creation"
    end
  end
end
