require './book'

describe 'Book' do
  before :each do
    @books = Book.new(publisher: 'mitch', publish_date: '011/03/2000', cover_state: true, archived: false)
  end

  describe 'initialize' do
    it 'should be a Book' do
      expect(@books).to be_instance_of(Book)
    end

    it 'should initialize with id' do
      expect(@books.id.nil?).to be_falsey
    end
  end

  describe 'Unit test for Book' do
    it 'should be on cover state' do
      expect(@books.cover_state).to eq(true)
    end

    it 'Can be archived' do
      expect(@books.can_be_archived?).to eq(true)
    end

    it 'Should be archived' do
      @books.move_to_archive
      expect(@books.archived).to eq(true)
    end
  end
end
