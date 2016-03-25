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

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new account to the database' do
        expect{post :create, account: attributes_for(:account)}.to change(Account, :count).by(1)
      end
      it 'redirects to the login page' do
            
      end
    end

    context 'with invalid attributs' do
      it 'does not save the new account to the database' do
        
      end
      it 're-renders the new account template' do
        
      end
    end
  end    
end
