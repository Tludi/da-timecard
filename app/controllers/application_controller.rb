# application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  around_action :user_time_zone, if: :current_user

  def admin?
    current_user.role == 'Admin'
  end

  private

  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.account.time_zone, &block)
  end
end
