require 'rails_helper'

RSpec.describe Admin::AccountsController, :type => :controller do

  describe "GET #index" do
    it "renders the index template" do
      admin = create(:user, role: "Admin")
      login_user(user = admin, route = login_path)
      get :index
      expect(response).to render_template :index
    end

    it "gets all of the accounts" do
      admin = create(:user, role: "Admin")
      login_user(user = admin, route = login_path)
      accounts = [admin.account]
      accounts << create(:account)
      get :index
      expect(assigns(:accounts)).to match_array accounts
    end

  end

  describe "GET #show" do
    it "assigns the requested account to @account"

    it "renders the show template"

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
