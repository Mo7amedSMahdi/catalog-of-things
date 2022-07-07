require './label'

describe 'Book' do
  before :each do
    @label = Label.new('mitch', 'red', items: [])
  end

  context 'initialize' do
    it 'should be a Label' do
      expect(@label).to be_instance_of(Label)
    end

    it 'should initialize with id' do
      expect(@label.id).to be_falsey
    end
  end

  context 'test for title' do
    it 'should be on cover state' do
      expect(@label.title).to eq('mitch')
    end

    it 'test of color should be red' do
      expect(@label.color).to eq('red')
    end

    it 'items value should be empty' do
      expect(@label.items).to eq([])
    end
  end
end
