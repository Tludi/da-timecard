class TimePunchesController < ApplicationController
  before_action :set_workday, only: [:new, :create]

  def new
    @timePunch = @workday.timePunches.new
  end


  def create
    # @currentTimePunch = @workday.getLastTimePunch
    @currentStatus = @workday.getCurrentStatus

    # if @workday.timePunches.count == 0
    #   @currentStatus = false
    # else
    #   @lastTimePunch = @workday.timePunches.last
    #   @currentStatus = @lastTimePunch.clockedInStatus
    # end

    @mytime = Time.now.utc
    
    @timePunch = @workday.timePunches.build(:entry => @mytime.localtime, :clockedInStatus => !@currentStatus )

    respond_to do |format|
      if @workday.save
        format.html { redirect_to @workday, notice: 'clock record was successfully created.' }
        # format.json { render :show, status: :created, location: @workday }
      else
        format.html { redirect_to @workday, notice: 'clock record was not created.' }
        # format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timePunch = TimePunch.find(params[:id])
    @workday = @timePunch.workday_id
    @timePunch.destroy
    respond_to do |format|
      format.html { redirect_to workday_path(@workday), notice: 'record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private

    def set_workday
      @workday = Workday.find(params[:workday_id])
    end

    def timePunch_params
      params.require(:timePunch).permit(:entry, :workday_id, :clockedInStatus)
    end
end
