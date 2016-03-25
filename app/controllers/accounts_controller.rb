# accounts_controller.rb
class AccountsController < ApplicationController
  # before_action :set_account, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login

  def new
    @account = Account.new
    @user = @account.users.new
  end

  def create
    @account = Account.new(account_params)
    # @user = User.new
    # @account.users.first.role = "Admin"
    respond_to do |format|
      if @account.save
        format.html { redirect_to admin_accounts_path, notice: 'Account created.' }
      else
        format.html { render :new, notice: 'Account Not Created.' }
      end
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :time_zone, users_attributes: [:id, :name, :email, :password, :password_confirmation, :role, :account_id])
  end
end
