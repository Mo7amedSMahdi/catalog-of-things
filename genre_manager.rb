class GenreManager
  attr_reader :geners_list

  def initialize
    @geners_list = []
  end

  def add_genre(genre)
    @geners_list.push(genre) unless @geners_list.include?(genre)
  end

  def create_genre
    puts '############################'
    puts '###### Creating Genre ######'
    puts '############################'
    puts 'Enter genre name:'
    name = gets.chomp
    genre = Genre.new(name: name)
    add_genre(genre)
    puts '*****************************'
    puts '****** Genre created! *******'
    puts '*****************************'
  end

  def get_genre_from_index(index)
    @geners_list[index]
  end

  def list_genre_with_index
    puts '############################'
    puts '###### Listing Genres ######'
    puts '############################'
    @geners_list.each_with_index { |genre, index| puts "#{index + 1}) Name: #{genre.name}" }
  end
end
