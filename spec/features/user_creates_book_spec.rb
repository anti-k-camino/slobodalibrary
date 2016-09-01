require_relative 'acceptance_helper'

feature 'User adds a book', %q{
  In order to participate in this resource
  as an authenticated User
  I want to add a book
}do 
  context 'Authenticated user' do
    let!(:user){ create :user }
    context 'without category and front image' do
      scenario 'User adds a book' , js: true do
        sign_in user
        within '.new_book' do
          fill_in 'Title', with: 'SomeTitle'
          fill_in 'Description', with: 'SomeDescription'
          fill_in 'Author', with: 'SomeAuthor'
          click_on 'Submit'
          wait_for_ajax
        end
        expect(current_path).to eq profile_index_path
        expect(page).to have_content 'SomeTitle'
      end 
    end  

    context 'with front image' do
      scenario 'User adds a book and a pic', js: :true do
        sign_in user
         within '.new_book' do
          fill_in 'Title', with: 'SomeTitle'
          fill_in 'Description', with: 'SomeDescription'
          fill_in 'Author', with: 'SomeAuthor'                    
          attach_file 'book[front]', File.join(Rails.root, 'spec', 'fixtures', 'photo.jpeg')                   
          click_on 'Submit'          
          wait_for_ajax
        end        
        within '.book_show' do         
          expect(page).to have_css("img[src*='photo.jpeg']")
          expect(page).to have_content 'SomeTitle'
          expect(page).to have_content 'SomeDescription'
          expect(page).to have_content 'SomeAuthor'
        end
      end
    end   
  end
end