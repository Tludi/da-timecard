class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      if @user.role == "Admin"
        redirect_to(admin_root_path)
      else
        @userWorkday = Workday.retrieveCurrentWorkday(@user)
        if @userWorkday
          redirect_to(workday_path(@userWorkday), notice: "retrieved existing workday")
        else
          @newWorkday = Workday.createCurrentWorkday(@user)
          redirect_to(@newWorkday, notice: "created new workday")
          # redirect_to(:home)
        end
      end
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out')
  end
end
