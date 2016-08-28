require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  context 'Authenticated user' do
    sign_in_user
    describe 'POST#create' do
      it 'should change user books count' do
        expect{ post :create, book:{title: 'SomeText', author:'SomeAuthor', description:'SomeDescription'}, format: :js}.to change(@user.books, :count).by 1
      end
    end
  end

end
