require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :author }
  it { should have_db_index :title }

  describe 'available?' do
    let!(:book){ create :book }
    let!(:published_book){ create :published_book }

    it 'should be not available when un-published' do
      expect(book.available?).to be_falsy
    end

    it 'should be available when published' do
      expect(published_book.available?).to be_truthy
    end
  end

  describe 'publish' do
    let!(:book){ create :book }
    
    it "should make book available" do
      book.publish
      expect(book.available?).to be_truthy
    end
  end

  describe 'draft' do
    let!(:book){ create :published_book }

    it 'should make book un-available(draft)' do
      book.draft
      expect(book.available?).to be_falsy
    end
  end

  describe 'weekly' do
    let!(:books){ create_list( :book, 3) }
    let!(:published_books){ create_list(:published_book, 2)}
    
    let!(:out_of_date_book){ create :out_of_date_book }

    it 'should return last week published books' do
      expect(Book.weekly).to match_array published_books
    end

    it 'should not return books published more than week ago' do
      expect(Book.weekly.include?(out_of_date_book)).to be_falsy
    end

  end
end
