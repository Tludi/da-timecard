# dashboards_controller.rb
# diligent agility
# doozer
# 1-14-20016

class DashboardsController < ApplicationController


  def index

    @user = current_user

  end

end
