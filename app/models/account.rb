class Account < ApplicationRecord
  authenticates_with_sorcery!

  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users
  has_many :projects, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  validates_presence_of :name, :time_zone
  # validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)


end
