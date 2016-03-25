# accounts_controller.rb
class AccountsController < ApplicationController
  skip_before_action :require_login
  def new
    @account = Account.new
  end
end
