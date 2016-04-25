# admin_controller.rb

class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_login
  before_action :require_admin
  around_filter :account_time_zone

  helper_method :userFullName, :userAccount

  def userFullName
    current_user.firstName + " " + current_user.lastName
  end

  def userAccount
    current_user.account
  end

  private
    def require_admin
      unless current_user.role == "Admin"
        redirect_to dashboard_url
      end
    end

    def account_time_zone(&block)
      Time.use_zone(current_user.account.time_zone, &block)
    end

end
