require 'json'
require_relative 'author'
class AuthorManager
  attr_accessor :authors

  def initialize
    @authors = []
  end

  def add_author
    puts '####################################'
    puts '###### Creating a New Author #######'
    puts '####################################'
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors.push(author) unless @authors.include?(author)
    author
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index}) #{author.to_json}"
    end
  end

  def store_authors
    File.write('data/author.json', JSON.pretty_generate(@authors), mode: 'w')
  end

  def load
    @authors = JSON.parse(File.read('data/author.json')) if File.exist?('data/author.json')
  end
end
