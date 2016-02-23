class TimePunch < ActiveRecord::Base
  belongs_to :workday

  def invertStatus(currentStatus)
    !currentStatus
  end
  
end
