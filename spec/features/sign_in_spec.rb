require 'rails_helper'

feature 'User sign in', %q{
  In order to be able to see/publish/draft a book
  as a User
  I want to be able to sign in
}do 

  scenario 'Registered user try to sign in' do
    User.create!(email: 'user@email.com', password: '123456', name: 'SomeUser')

    visit_new_user_session_path
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to eq root_path
  end

  scenario 'Non-registered user try to sign in' do
    visit_new_user_session_path
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Invalid email or password.'
    expect(current_path).to eq new_user_session_path
  end
end