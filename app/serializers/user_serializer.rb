class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :pin

  has_many :workdays
end
