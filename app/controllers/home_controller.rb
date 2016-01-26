# home_controller.rb
class HomeController < ApplicationController


  def index

    @users = User.all

  end

  def login

    @user = User.new

  end

end