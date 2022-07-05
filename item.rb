require 'date'
require 'pry'

class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date:, id:, archived: false)
    @id = id || Random.rand(1..1_000_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre&.items&.push(self)
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end
