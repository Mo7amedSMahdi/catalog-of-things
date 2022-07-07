require './book'
require './label_manager'
require 'json'

class BookManager
  def initialize
    @books = []
  end

  def add_book(book)
    @books.push(book) unless @books.include?(book)
  end

  def save_books
    json_array = []
    json_array << @books.map { |book| book_to_json(book) } unless @books.empty?
    File.write('data/books.json', "[#{json_array.join(',')}]")
  end

  def load_books(label_manager)
    array_hash = read_books
    return [] if array_hash.empty?

    array_hash.each do |hash|
      book = Book.new(id: hash['id'], publish_date: hash['publish_date'], cover_state: hash['cover_state'],
                      publisher: hash['publisher'], archived: hash['archived'])

      label = label_manager.get_label_from_id(hash['label'])
      book.add_label(label)
      @books.push(book)
    end
  end

  def read_books
    if File.exist?('data/books.json')
      data = File.read('data/books.json')
      return JSON.parse(data)
    end
    []
  end

  def book_to_json(book)
    { publish_date: book.publish_date, label: book.label&.id, publisher: book.publisher,
      cover_state: book.cover_state, archived: book.archived }.to_json
  end

  def create_book(label_manager)
    puts '############################'
    puts '###### Creating Book ######'
    puts '############################'
    puts 'Enter book publisher:'
    publisher = gets.chomp
    puts 'Enter book cover_sate:'
    cover_state = gets.chomp
    puts 'Enter book publish date:'
    publish_date = gets.chomp
    puts 'is Archived ? (y/n)'
    archived = gets.chomp == 'y'
    books = Book.new(publisher: publisher, cover_state: cover_state, publish_date: publish_date, archived: archived)
    if archived
      books.move_to_archive
      puts "It wasn't possible to archive this book" if books.archived == false
    end
    puts "1) Create a new label to use \n2) List and use an existing label\n3) Create without label"
    option = gets.chomp
    label = prompt_label(option, label_manager)
    label && books.add_label(label)
    label_manager.add_label(label) unless label_manager.labels.include?(label)
    @books.push(books)
    puts 'Book  created!'
    puts '************************************'
    puts '******* Book created! *******'
    puts '************************************'
  end

  def prompt_label(option, label_manager)
    case option
    when '1'
      label_manager.create_label
    when '2'
      label_manager.list_label_with_index
      label_index = gets.chomp.to_i
      label = label_manager.get_label_from_index(label_index - 1)
      puts "No label found with index #{label_index}" if label.nil?
      label
    when '3'
      puts 'creating book without label'
      nil
    else
      puts 'Invalid option'
    end
  end

  def list_book_with_index
    puts '##################################'
    puts '###### Listing Book ######'
    puts '##################################'
    @books.each_with_index do |book, index|
      puts "#{index + 1}.id: #{book.id} publisher: #{book.publisher} cover_state: #{book.cover_state} publish date: #{book.publish_date} archived: #{book.archived}"
    end
  end
end
