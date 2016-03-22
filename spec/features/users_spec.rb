require 'rails_helper'
include Sorcery::TestHelpers::Rails::Integration
include Sorcery::TestHelpers::Rails::Controller

feature 'User management' do
  def login_user(user)
    visit login_path
    fill_in('Email', with: user.email)
    fill_in('Password', with: 'password')
    click_button('Sign in')
  end

  scenario 'adds a new user' do
    admin = create(:admin)
    create(:role)
    login_user admin

    visit admin_dashboards_path(admin)
    expect{
      click_link 'New User'
      fill_in 'Firstname', with: 'Test'
      fill_in 'Lastname', with: 'User'
      fill_in 'Email', with: 'testuser@email.com'
      select 'Crew', from: 'user_role'
      fill_in 'Pin', with: '1234'
      fill_in 'Password', with: 'secret1234'
      fill_in 'Password confirmation', with: 'secret1234'
      click_button 'Create User'
    }.to change(User, :count).by(1)

    # save_and_open_page
  end
end
