require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    let!(:books) { create_list(:book, 2) }
    let!(:published_books){ create_list(:published_book, 2)}
    let!(:out_of_date_book){ create :out_of_date_book }

    before { get :index }

    it 'populates an array of books published this week' do
      expect(assigns(:books)).to match_array(published_books)
    end

    it 'does not return expired books' do
      expect(assigns(:books).include?(out_of_date_book)).to be_falsy
    end

    it 'does not include drafted book' do
      published_books[0].draft
      expect(assigns(:books)[0]).to eq published_books[1]
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
