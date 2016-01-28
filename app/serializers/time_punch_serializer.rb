class TimePunchSerializer < ActiveModel::Serializer
  attributes :id, :entry, :workday_id, :clockedInStatus
end
