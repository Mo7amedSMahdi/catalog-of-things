require 'json'
require './label'

class LabelManager
  attr_reader :labels

  def initialize
    @labels = []
  end

  def add_label(label)
    return if label.nil?

    @labels.push(label) unless @labels.include?(label)
  end

  def save_labels
    json_array = []
    json_array << @labels.map { |label| label_to_json(label) } unless @labels.empty?
    File.write('data/labels.json', "[#{json_array.join(',')}]")
  end

  def load_labels
    array_hash = read_labels
    return [] if array_hash.empty?

    array_hash.each do |hash|
      label = Label.new(id: hash['id'], title: hash['title'], color: hash['color'])
      add_label(label)
    end
  end

  def read_labels
    if File.exist?('data/labels.json')
      data = File.read('data/labels.json')
      return JSON.parse(data)
    end
    []
  end

  def label_to_json(label)
    return if label.nil?

    { id: label.id, title: label.title, color: label.color }.to_json
  end

  def create_label
    puts '############################'
    puts '###### Creating Label ######'
    puts '############################'
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title: title, color: color)
    check_if_label_exists?(title) ? get_label_from_title(title) : label
  end

  def check_if_label_exists?(title)
    if list_of_label_titles.include?(title.downcase)
      puts 'label is already in the list of labels'
      true
    else
      puts '*************************************'
      puts "****** Label #{title} created! *******"
      puts '*************************************'
      false
    end
  end

  def list_of_label_titles
    arr = []
    @labels.each { |e| arr.push(e.title.downcase) }
    arr
  end

  def get_label_from_index(index)
    @labels[index]
  end

  def list_label_with_index
    puts '############################'
    puts '###### Listing Labels ######'
    puts '############################'
    @labels.each_with_index { |label, index| puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}" }
  end

  def get_label_from_id(id)
    @labels.find do |label|
      label.id == id
    end
  end
end
