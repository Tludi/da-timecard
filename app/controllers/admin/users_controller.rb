# admin users_controller.rb

class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_account

  def index
    @users = @account.users.all
  end

  def show
    @workdays = @user.workdays
  end

  def new
    @user = User.new
    @userRoles = Role.where.not(name: "SuperUser")
  end

  def edit
  end

  def create
    @user = @account.users.new(user_params)
    # @userRoles = Role.where.not(name: "SuperUser")
    @userRoles = Role.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_account
      @account = current_user.account
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstName, :lastName, :pin, :email, :password, :password_confirmation, :role)
    end

end
