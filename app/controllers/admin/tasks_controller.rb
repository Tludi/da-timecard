class Admin::TasksController < Admin::AdminController
  before_action :set_account
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = @account.tasks
    @projects = Project.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = @account.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to admin_tasks_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to admin_tasks_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to admin_tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.account
    end

    def set_task
      @task = @account.tasks.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description,  :account_id)
    end
end
