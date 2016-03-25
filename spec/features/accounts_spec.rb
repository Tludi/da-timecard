require 'rails_helper'

feature "Accounts", :type => :feature do
  scenario 'creating a new account' do
    visit new_account_path
    
  end
end
