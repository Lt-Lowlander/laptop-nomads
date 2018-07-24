require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message

  scenario 'provide valid registration information' do
    user = FactoryBot.create(:user)

    visit new_user_registration_path

    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Bio', with: user.bio
    fill_in 'Profile Photo', with: user.profile_photo
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
