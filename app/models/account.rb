class Account < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users

  # validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  # has_many :projects, dependent: :destroy

end
