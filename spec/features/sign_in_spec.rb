require 'rails_helper'

feature 'User sign in', %q{
  In order to be able to see/publish/draft a book
  as a User
  I want to be able to sign in
}do 
  context 'ordinary user' do    
    scenario 'Registered user try to sign in' do
      User.create!(email: 'user@email.com', password: '123456', name: 'SomeUser')      

      visit new_user_session_path    
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'

      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq profile_index_path
    end

    scenario 'Non-registered user try to sign in' do
      visit new_user_session_path
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'

      expect(page).to have_content 'Invalid Email or password.'
      expect(current_path).to eq new_user_session_path
    end
  end
  context 'admin user' do
    let!(:admin){ create :admin}

    scenario 'Admin user try to sign in' do
      visit new_user_session_path    
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'

      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq admin_dash_board_index_path
    end
  end
end