require 'rails_helper'

RSpec.describe Admin::AccountsController, :type => :controller do

  before :each do
    @admin = create(:admin)
    login_user(user = @admin, route = login_path)
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

    it "gets all of the accounts" do
      accounts = [@admin.account]
      accounts << create(:account)
      get :index
      # tests admin account and new account exists
      expect(assigns(:accounts).count).to eq 2
      # tests index @accounts == admin account and new account (accounts array)
      expect(assigns(:accounts)).to match_array accounts
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      account = create(:account)
      get :show, id: account
      expect(response).to render_template :show
    end

    it "assigns the requested account to @account" do
      account = create(:account)
      get :show, id: account
      expect(assigns(:account)).to eq account
    end
  end

  describe "GET #new" do
    it "assigns a new account to @account"

    it "renders the new template"

  end

  describe "GET #edit" do
    it "assigns the requested account to @account"

    it "renders the edit template"

  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new account in the database"

      it "redirects to the account#show page"

    end

    context "with invalid attributes" do
      it "does not save the new account in the database"

      it "re-renders the new template"

    end

  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "upates the account in the database"

      it "redirects to the account"

    end

    context "with invalid attributes" do
      it "does not update the account"

      it "re-renders the edit template"

    end

  end

  describe "when DELETE #destroy" do
    it "deletes the account from the database"

    it "redirects to the account#index"

  end
end
