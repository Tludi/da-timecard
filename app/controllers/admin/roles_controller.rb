class Admin::RolesController < Admin::AdminController

  def index
    @roles = userAccount.roles.all
  end

  def new
    @role = userAccount.roles.new
  end

  def create
    @role = userAccount.roles.new(user_params)


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

  def update
  end

  def destroy
  end



end
