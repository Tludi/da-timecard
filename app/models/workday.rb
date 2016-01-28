class Workday < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  has_many :timePunches

  accepts_nested_attributes_for :timePunches
  
end
