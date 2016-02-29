class Workday < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  has_many :timePunches

  accepts_nested_attributes_for :timePunches

  validates_presence_of :dayDate, :hoursWorked

  def getLastTimePunch
    timePunches.last
  end

  def getCurrentStatus
    currentTimePunch = getLastTimePunch
    if currentTimePunch == nil
      false
    else
      currentTimePunch.clockedInStatus
    end
  end

  def self.calculateWorkhours(workday)
    # get current workday punches and push times to array
    @punches = []
    workdayPunches = workday.timePunches
    workdayPunches.each do |p|
      @punches << p.created_at
    end

    # group punches in pairs then push to array
    punchGroups = []
    @punches.in_groups_of(2, Time.now) do |group| # Time.now is used when punch count is odd
      punchGroups << group
    end

    # Iterate throug groups of punch pairs to get time difference
    # and add each groups difference for a total hours worked
    @workHours = 0
    punchGroups.each do |pg|
      @workHours += TimeDifference.between(pg[0], pg[1]).in_hours
    end
    # convert the fractional of hours worked from hour percentage to minutes
    workHourModulus = @workHours.modulo(1)*0.6.round(2)
    workHourWholeNumber = @workHours.round(0)
    return workHourWholeNumber + workHourModulus
  end

  def self.retrieveCurrentWorkday(user)
    wd = user.workdays.last
    # userWorkdays = user.workdays.all
    # userWorkdays.each do |wd|
      if wd.dayDate == DateTime.now.to_date
        wd
      else
        nil
      end
    # end
  end

  def self.createCurrentWorkday(user)
    workday = Workday.create(user_id: user.id, project_id: 1, dayDate: DateTime.now.to_date, hoursWorked: 0)
  end

  def currentTimeZone
    user.account.time_zone
  end
end
