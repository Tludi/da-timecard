require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end

    it 'assigns an account to @account' do
      get :new
      expect(assigns(:account)).to be_a_new(Account)
    end
  end    
end
