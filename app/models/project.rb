class Project < ActiveRecord::Base
  has_many :workdays
  has_many :users, through: :workdays
end
