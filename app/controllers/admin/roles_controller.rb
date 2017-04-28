class Admin::RolesController < Admin::AdminController
  before_action :set_role, only: [:edit, :update, :destroy]
  before_action :set_account

  def index
    @roles = @account.roles.all
  end

  def new
    @role = @account.roles.new
  end

  def create
    @role = @account.roles.new(user_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to admin_roles_path, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
      respond_to do |format|
      if @role.update(user_params)
        format.html { redirect_to admin_roles_path, notice: 'Role was successfully updated.' }
        format.json { render :index, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to admin_roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    def set_account
      @account = current_user.account
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:role).permit(:name, :account_id)
    end


end
