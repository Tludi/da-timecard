# DashboardController.rb

class Admin::DashboardController < Admin::AdminController

  def index
    @users = User.all
    @projects = Project.all
  end

end