require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    let!(:books) { create_list(:book, 2) }
    let!(:book1){ create :book, published_at: DateTime.now }
    let!(:book2){ create :book, published_at: DateTime.now }
    let!(:book3){ create :book, published_at: DateTime.now - 8 }

    before { get :index }

    it 'populates an array of books published this week' do
      expect(assigns(:books)).to match_array([book1, book2])
    end

    it 'does not return expired books' do
      expect(assigns(:books).include?(book3)).to be_falsy
    end

    it 'does not include drafted book' do
      book1.draft
      expect(assigns(:books)[0]).to eq book2
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
