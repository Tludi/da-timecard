# admin account_controller.rb
class Admin::AccountsController < Admin::AdminController
  before_action :set_account, only: [:show, :destroy]

  def index
    @accounts = Account.all

  end

  def show
    @current_account = current_user.account
    @current_account_users = @current_account.users
  end

  def new
    @account = Account.new
    @account.users.build
  end

  def create
    @account = Account.new(account_params)
    @account.users.first.role = "Admin"
    respond_to do |format|
      if @account.save
        format.html{ redirect_to accounts_path, notice: 'Account created.' }
      else
        format.html {redirect_to accounts_path, notice: 'Account Not Created.'}
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
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
