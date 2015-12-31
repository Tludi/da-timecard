class WorkdaySerializer < ActiveModel::Serializer
  attributes :user_id, :hoursWorked, :dayDate

  # belongs_to :user_id
end
