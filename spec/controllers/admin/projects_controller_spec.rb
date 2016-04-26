require 'rails_helper'

RSpec.describe Admin::ProjectsController, :type => :controller do
  before :each do
    @admin = create(:admin)
    login_user(user = @admin, route = login_path)
  end
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
    
    it "assigns a project to @project" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

end
