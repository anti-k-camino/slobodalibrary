require_relative 'acceptance_helper'

feature 'User a book to draft', %q{
  In order to hide book from others
  as an authenticated User
  I want to put a book to draft
}do 
  context 'Authenticated user' do
    let!(:user){ create :user }
    let!(:book){ create :book, user: user, published_at: DateTime.now }
    scenario 'puts a book to draft',js: true do
      sign_in user
      visit root_path
      expect(page).to have_content book.title
      visit profile_index_path 
      within "#book_#{book.id}" do
        click_on 'draft'
        wait_for_ajax
      end
      expect(page).to_not have_selector("input[type=submit][value='draft']")
      expect(page).to have_selector("input[type=submit][value='publish']")
      visit root_path
      expect(page).to_not have_content book.title
    end
  end
end