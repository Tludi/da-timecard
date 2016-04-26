# accounts_controller.rb
class AccountsController < ApplicationController
  skip_before_action :require_login

  def new
    @account = Account.new
    @account.users.build
  end

  def create
    @account = Account.new(account_params)
    # @account.users.first.role = "Admin"
    respond_to do |format|
      if @account.save
        @account.users.first.update_attribute(:role, "Admin")
        @account.projects.create(name: "General Work")
        # @user = @account.users.create(account_params[:user])
        format.html { redirect_to login_path, notice: "Hi #{@account.users.first.firstName}! Account created. Now Log In." }
      else
        format.html { render :new, notice: 'Account Not Created.' }
      end
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :time_zone, users_attributes: [:id, :firstName, :lastName, :email, :password, :password_confirmation, :role, :account_id])
  end
end
