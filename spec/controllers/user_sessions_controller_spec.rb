require 'rails_helper'

RSpec.describe UserSessionsController, :type => :controller do

  before :each do
    @user = create(:user)
    login_user(user = @user, route = login_path)
    @account = @user.account
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
    
    it "assigns a user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "has a successful login" do
        expect(response.status).to eq(200)
      end

      it "loads the dashboard when logged in" 
      #
      # it "redirects to the admin_account#index page" do
      #   post :create, account: attributes_for(:account)
      #   expect(response).to redirect_to admin_accounts_path
      # end

    end

    context "with invalid attributes" do
      # it "does not save the new account in the database" do
      #  expect{ post :create, account: attributes_for(:invalid_account)}.not_to change(Account, :count)
      # end
      #
      # it "re-renders the new template" do
      #   post :create, account: attributes_for(:invalid_account)
      #   expect(response).to render_template :new
      # end

    end

  end

  describe "when DELETE #destroy" do
    it "deletes the current session and redirects to login page" do
      logout_user
      get :destroy
      expect(response).to redirect_to login_path
    end
  end

end
