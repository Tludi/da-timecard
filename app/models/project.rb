class Project < ApplicationRecord
  has_many :workdays
  has_many :users, -> {uniq}, through: :workdays
  belongs_to :account

  validates_presence_of :name
end
