# home_controller.rb
class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index

    @users = User.all

  end

end