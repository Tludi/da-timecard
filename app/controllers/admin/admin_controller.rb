# admin_controller.rb

class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_login
  before_action :is_admin?

  private
    def is_admin?
      unless current_user.role == "Admin"
        redirect_to dashboards_path(current_user)
      end
    end

end
