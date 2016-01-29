class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])

      @userWorkday = Workday.retrieveCurrentWorkday(@user)
      if @userWorkday == true
        redirect_to(@userWorkday)
      else
        @newWorkday = Workday.createCurrentWorkday(@user)
        redirect_to(@newWorkday)
        # redirect_to(:home)
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
