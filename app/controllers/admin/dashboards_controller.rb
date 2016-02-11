# DashboardController.rb

class Admin::DashboardsController < Admin::AdminController

  def index
    @users = User.all
    @projects = Project.all
  end

end