class User < ActiveRecord::Base

  has_many :workdays, dependent: :destroy
  accepts_nested_attributes_for :workdays
end
