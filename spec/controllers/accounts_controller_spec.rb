require 'rails_helper'

RSpec.describe Admin::AccountsController, :type => :controller do

  before :each do
    @admin = create(:admin)
    login_user(user = @admin, route = login_path)
    @account = @admin.account
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
      get :show, id: @account
      expect(response).to render_template :show
    end

    it "assigns the requested account to @account" do
      get :show, id: @account
      expect(assigns(:account)).to eq @account
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new account to @account" do
      get :new
      expect(assigns(:account)).to be_a_new(Account)
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      get :edit, id: @account
      expect(response).to render_template :edit
    end

    it "assigns the requested account to @account" do
      get :edit, id: @account
      expect(assigns(:account)).to eq @account
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new account in the database" do
        expect{ post :create, account: attributes_for(:account)}.to change(Account, :count).by(1)
      end

      it "redirects to the admin_account#index page" do
        post :create, account: attributes_for(:account)
        expect(response).to redirect_to admin_accounts_path
      end

    end

    context "with invalid attributes" do
      it "does not save the new account in the database" do
       expect{ post :create, account: attributes_for(:invalid_account)}.not_to change(Account, :count)
      end

      it "re-renders the new template" do
        post :create, account: attributes_for(:invalid_account)
        expect(response).to render_template :new
      end

    end

  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "upates the account in the database" do
        patch :update, id: @account, account: attributes_for(:account)
        expect(assigns(:account)).to eq @account
      end

      it "changes accounts attributes" do
        patch :update, id: @account, account: attributes_for(:account, name: 'Seahawks')
        @account.reload
        expect(@account.name).to eq 'Seahawks'
      end

      it "redirects to the account" do
        patch :update, id: @account, account: attributes_for(:account, name: 'Seahawks')
        @account.reload
        expect(response).to redirect_to admin_accounts_path
      end

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
