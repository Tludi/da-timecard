# dashboards_controller.rb
# diligent agility
# doozer
# 1-14-20016
class DashboardsController < ApplicationController
  
  # before_action :check_for_current_workday

  def index
    @user = current_user
    @workday = Workday.retrieve_current_workday(current_user)

    @current_time = get_current_time

    @time_punch = TimePunch.new
    @latest_time_punch = @workday.timePunches.last
    @time_punch_status = @latest_time_punch.clockedInStatus if @latest_time_punch
    @current_workday_time_punches = @workday.timePunches

    # @current_project = Project.find(@workday.project.id)
    @hours_worked = Workday.calculate_workhours(@workday)
    @hours_saved = @workday.hoursWorked
  end

  private

  def check_for_current_workday
    Workday.retrieve_current_workday(current_user)
  end

  def get_current_time
    Time.zone.today
  end

end
