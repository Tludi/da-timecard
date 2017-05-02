# admin/DashboardsController.rb
class Admin::DashboardsController < Admin::AdminController
  def index
    @current_account = current_user.account
    @users = @current_account.users.order(:role)
    @projects = @current_account.projects.order(:created_at)
  end
end
