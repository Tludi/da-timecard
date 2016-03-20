# admin/DashboardsController.rb
class Admin::DashboardsController < Admin::AdminController
  def index
    @current_account = current_user.account
    @users = @current_account.users
    @projects = @current_account.projects
  end
end
