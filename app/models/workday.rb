class Workday < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  has_many :timePunches

  accepts_nested_attributes_for :timePunches
  
  def self.calculateWorkhours(workday)
    @punches = [] 
    workdayPunches = workday.timePunches
    workdayPunches.each do |p|
      @punches << p.created_at
    end

    punchGroups = []
    @punches.in_groups_of(2, Time.now) do |group|
      punchGroups << group
    end

    @workHours = 0
    punchGroups.each do |pg|
      @workHours += TimeDifference.between(pg[0], pg[1]).in_hours
    end

    return @workHours
  end
end
