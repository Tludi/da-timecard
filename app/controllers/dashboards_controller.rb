# dashboards_controller.rb
# diligent agility
# doozer
# 1-14-20016

class DashboardsController < ApplicationController
  
  # before_action :check_for_current_workday

  def index
    @workday = Workday.retrieveCurrentWorkday(current_user)
  end

  private
    def check_for_current_workday
      Workday.retrieveCurrentWorkday(current_user)
    end

end
