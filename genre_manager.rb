require 'json'
require './genre'
require 'pry'

class GenreManager
  attr_reader :genres_list

  def initialize
    @genres_list = []
  end

  def add_genre(genre)
    return if genre.nil?

    @genres_list.push(genre) unless @genres_list.include?(genre)
  end

  def save
    json_array = []
    json_array << @genres_list.map { |genre| genre_to_json(genre) } unless @genres_list.empty?
    binding.pry
    File.write('data/genres.json', "[#{json_array.join(',')}]")
  end

  def load
    array_hash = read_file
    return [] if array_hash.empty?

    array_hash.each do |hash|
      genre = Genre.new(id: hash['id'], name: hash['name'])
      add_genre(genre)
    end

    binding.pry
  end

  def read_file
    if File.exist?('data/genres.json')
      data = File.read('data/genres.json')
      return JSON.parse(data)
    end
    []
  end

  def genre_to_json(genre)
    return if genre.nil?

    { id: genre.id, name: genre.name }.to_json
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
    @genres_list.each { |e| arr.push(e.name.downcase) }
    arr
  end

  def get_genre_from_index(index)
    @genres_list[index]
  end

  def list_genre_with_index
    puts '############################'
    puts '###### Listing Genres ######'
    puts '############################'
    @genres_list.each_with_index { |genre, index| puts "#{index + 1}) Name: #{genre.name}" }
  end

  def get_genre_from_id(id)
    @genres_list.find do |genre|
      genre.id == id
    end
  end
end
