require './music_album_manager'
require './genre_manager'
require './book_manager'
require './label_manager'
require './author_manager'
require './game_manager'
class App
  def initialize
    @books = BookManager.new
    @labels = LabelManager.new
    @labels.load_labels
    @books.load_books(@labels)
    @music_manager = MusicAlbumManager.new
    @genre_manager = GenreManager.new
    @genre_manager.load
    @music_manager.load(@genre_manager)
    @author_manager = AuthorManager.new
    @author_manager.load
    @game_manager = GameManager.new
    @game_manager.load
    @options = {
      '0' => 'Save and Exit',
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all games',
      '4' => 'List all geners',
      '5' => 'List all labels',
      '6' => 'List all authors',
      '7' => 'Add a book',
      '8' => 'Add a music album',
      '9' => 'Add a game'
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
      @books.list_book_with_index
    when '2'
      @music_manager.list_music_albums_with_index
    when '3'
      @game_manager.list_games
    when '4'
      @genre_manager.list_genre_with_index
    when '5'
      @labels.list_label_with_index
    when '6'
      @author_manager.list_authors
    when '7'
      @books.create_book(@labels)
    when '8'
      @music_manager.create_music_album(@genre_manager)
    when '9'
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
    @books.save_books
    @labels.save_labels
    @author_manager.store_authors
    @game_manager.store_games
  end
end
app = App.new
app.run
