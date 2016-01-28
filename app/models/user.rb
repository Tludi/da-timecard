class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :workdays, dependent: :destroy
  has_many :projects, through: :workdays
  
  accepts_nested_attributes_for :workdays

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

end
