# admin_controller.rb

class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_login
  before_action :require_admin

  helper_method :userFullName

  def userFullName
    current_user.firstName + " " + current_user.lastName
  end

  private
    def require_admin
      unless current_user.role == "Admin"
        redirect_to dashboards_path(current_user)
      end
    end

end
