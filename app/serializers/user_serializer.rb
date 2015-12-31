class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName

  # has_many :workdays
end
