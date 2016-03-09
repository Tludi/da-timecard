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
    @punches.in_groups_of(2, Time.current) do |group| # Time.current is used when punch count is odd
      punchGroups << group
    end

    # Iterate through groups of punch pairs to get time difference
    # and add each groups difference for a total hours worked
    @workHours = 0
    punchGroups.each do |pg|
      # @workHours += TimeDifference.between(pg[0], pg[1]).in_hours
      @workHours += pg[1] - pg[0]
    end
    # convert the fractional of hours worked from hour percentage to minutes
    # workHourModulus = @workHours.modulo(1)*0.6.round(2)
    # workHourWholeNumber = @workHours.round(0)
    # workdayHours = workHourWholeNumber + workHourModulus
    workday.hoursWorked = @workHours
    workday.save
    return @workHours
    end

  def self.retrieveCurrentWorkday(user)
    wd = user.workdays.last
    # userWorkdays = user.workdays.all
    # userWorkdays.each do |wd|
      if wd.dayDate == Date.current
        wd
      else
        nil
      end
    # end
  end

  def self.createCurrentWorkday(user)
    tz = user.account.time_zone
    Time.zone = tz
    workday = Workday.create(user_id: user.id, project_id: 1, dayDate: Date.current, hoursWorked: 0)
  end



end
