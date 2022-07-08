require './music_album_manager'
require './genre_manager'
require './book_manager'
require './label_manager'
require './author_manager'
require './game_manager'

class App
  def initialize
    @music_manager = MusicAlbumManager.new
    @genre_manager = GenreManager.new
    @genre_manager.load
    @music_manager.load(@genre_manager)
    @options = {
      '0' => 'Save and Exit',
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List all games',
      '5' => 'List all geners',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all sources',
      '9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game'
    }
  end

  def run
    puts '##############################################'
    puts '###### Welcome to Catalog of my things #######'
    puts '##############################################'
    loop do
      puts ''
      puts 'Please choose an option by eterin a number:'
      @options.each { |key, value| puts "#{key}) #{value}" }
      option = gets.chomp
      if option == '0'
        save_and_exit
        break
      end

      menu_choice option
    end
  end

  def menu_choice(option)
    case option
    when '1'
      'Listing all books'
    when '2'
      @music_manager.list_music_albums_with_index
    when '3'
      'Listing all movies'
    when '4'
      'Listing of games'
    when '5'
      @genre_manager.list_genre_with_index
    when '6'
      'Listing all labels'
    when '7'
      'Listing all authors'
    when '8'
      'Listing all sources'
    when '9'
      'Adding a book'
    when '10'
      @music_manager.create_music_album(@genre_manager)
    when '11'
      'Adding a movie'
    when '12'
      @game_manager.add_game(@author_manager)
    else
      puts 'Not a valid option'
    end
  end

  def save_and_exit
    puts '##############################'
    puts '###### Saving Data... #######'
    puts '#############################'
    @music_manager.save
    @genre_manager.save
  end
end

app = App.new
app.run
