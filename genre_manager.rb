class GenreManager
  attr_reader :geners_list
  def initialize
    @geners_list = []
  end

  def add_genre(genre)
    @geners_list.push(genre) unless @geners_list.include?(genre)
  end

  def create_genre
    puts "############################"
    puts "###### Creating Genre ######"
    puts "############################"
    puts "Enter genre name:"
    name = gets.chomp
    genre = Genre.new(name: name)
    add_genre(genre)
  end
end
