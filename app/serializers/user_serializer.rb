class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName

  has_many :workdays
end
