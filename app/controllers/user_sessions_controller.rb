class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      Time.zone = @user.account.time_zone

      if @user.role == "Admin"
        redirect_to(admin_root_path)
      else
        @userWorkday = Workday.retrieveCurrentWorkday(@user)
        if @userWorkday != nil
          redirect_to(workday_path(@userWorkday), notice: "retrieved existing workday")
        else
          @newWorkday = Workday.createCurrentWorkday(@user)
          redirect_to(@newWorkday, notice: "created new workday")
          # redirect_to(:home)
        end
      end
    else
      Time.zone = "UTC"
      redirect_to(login_path, notice: "Login failed. Check your email or password.")
      # render action: 'new', notice: "Login failed"
      # flash.now[:notice] = 'Login failed'
    end
  end

  def destroy
    Time.zone = "UTC"
    logout
    redirect_to(:root, notice: 'Logged out')
  end
end
