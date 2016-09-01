require_relative 'acceptance_helper'

feature 'User publishes a book', %q{
  In order to show book to others
  as an authenticated User
  I want to publish a book
}do 
  context 'Authenticated user' do
    let!(:user){ create :user }
    let!(:book){ create :book, user: user }
    scenario 'publishes a book', js: true do
      sign_in user 
      visit root_path
      expect(page).to_not have_content book.title
      visit profile_index_path     
      within "#book_#{book.id}" do                      
        click_on 'publish'
        wait_for_ajax              
      end
      expect(page).to_not have_content 'publish'      
      page.should have_selector("input[type=submit][value='draft']")
      visit root_path
      expect(page).to have_content book.title
    end
  end
end