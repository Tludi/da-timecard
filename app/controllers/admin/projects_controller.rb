# projects_controller.rb
class Admin::ProjectsController < Admin::AdminController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :addUser]
  before_action :set_current_account, only: [:index, :new, :create]

  # GET /projects
  # GET /projects.json
  def index
    @projects = @current_account.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @users = User.all
    @projectUsers = @project.users.uniq
    @user = User.new
  end

  # GET /projects/new
  def new
    @project = @current_account.projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    # @project = Project.new(project_params)
    @project = @current_account.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to admin_projects_url, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to admin_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addUser
    user = User.find(params[:user])
    @project.users << user
    redirect_to admin_projects_path, notice: 'User was added'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_account
      @current_account = current_user.account
    end

    def set_project
      # @project = Project.find(params[:id])
      @project = current_user.account.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :address1, :address2, :city, :state, :zip_code, :contact, :contact_phone, :account_id, :users => [:firstName, :lastName, :pin, :email, :password, :password_confirmation, :role] )
    end
end
