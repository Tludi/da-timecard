class Project < ActiveRecord::Base
  has_many :workdays
  has_many :users, -> {uniq}, through: :workdays
end
