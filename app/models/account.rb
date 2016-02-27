class Account < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users
  has_many :projects, dependent: :destroy

  validates_presence_of :name, :time_zone
  # validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)


end
