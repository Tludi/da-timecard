class TimePunch < ActiveRecord::Base
  belongs_to :workday

  validates_presence_of :clockedInStatus, :entry

  def invertStatus(currentStatus)
    !currentStatus
  end
  
end
