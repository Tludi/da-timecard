json.array!(@workdays) do |workday|
  json.extract! workday, :id, :hoursWorked, :user_id, :dayDate, :project_id, :notes
  json.url workday_url(workday, format: :json)
end
