# admin/WorkdaysController.rb
class Admin::WorkdaysController < Admin::AdminController
  def index
    @current_account = current_user.account
    @users = @current_account.users
    @projects = @current_account.projects
  end

  def edit
    @workday = Workday.find(params[:id])
  end

  def update
  end

  private

  def workday_params
    params.require(:workday).permit(:hoursWorked, :user_id, :dayDate, :project_id, :notes, :timePunches => [:entry, :workday_id, :clockedInStatus])
  end
end
