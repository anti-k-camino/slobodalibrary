require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should have_many(:books).dependent(:destroy) }

  describe 'author_of?' do
    let!(:user){ create :user }
    let!(:another_user){ create :user }
    let!(:book){ create :book, user: user }

    it 'should confirm that user is the author' do
      expect(user.author_of?(book)).to be_truthy
    end

    it 'should reject that user is the author' do
      expect(another_user.author_of?(book)).to be_falsy
    end
  end
end
