require './genre'
require 'pry'

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
    check_if_genre_exists?(name) ? get_genre_from_name(name) : genre
  end

  def check_if_genre_exists?(name)
    if list_of_genre_names.include?(name.downcase)
      puts 'Genre is already in the list of genres'
      true
    else
      puts '*************************************'
      puts "****** Genre #{name} created! *******"
      puts '*************************************'
      false
    end
  end

  def list_of_genre_names
    arr = []
    @geners_list.each { |e| arr.push(e.name.downcase) }
    arr
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
