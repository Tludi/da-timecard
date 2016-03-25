require 'rails_helper'

RSpec.describe UserSessionsController, :type => :controller do

  before :each do
    @user = create(:user)
    # login_user(user = @user, route = login_path)
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
        login_user(@user, login_path)
        expect(response.status).to eq(200)
      end
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
