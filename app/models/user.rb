class User < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :account

  has_many :workdays, dependent: :destroy
  has_many :projects, -> {uniq}, through: :workdays

  accepts_nested_attributes_for :workdays

  validates_presence_of :firstName, :lastName, :email
  # validates :pin, length: {is: 4}
  validates :email, uniqueness: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  # gravtastic is a link to the gravatar system for rails
  include Gravtastic
  # default options - "mm", "identicon", "monsterid", "wavatar", "retro", "blank", or an absolut url
  # other options check https://github.com/chrislloyd/gravtastic
  gravtastic default: 'mm'

  def fullName
    [firstName.capitalize, lastName.capitalize].join(' ')
  end
end
