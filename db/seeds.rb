# Create 5 users
5.times do |i|
  User.create(firstName: "User ##{i}", lastName: "Surname ##{i}", role: "Crew" )
end

users = User.all
# print User count to terminal for verification
puts users.count






# Create 5 workdays for each User
current_time = DateTime.now
users.each do |u|
  n = 0
  5.times do |h|
    n += 24
    u.workdays.create(hoursWorked: 8, 
                      user_id: u.id,
                      dayDate: current_time - n.hours, # set each day backwards by 24 hours
                      project_id: 1,
                      notes: "notes to put here" )
  end
end

workdays = Workday.all
# print workday count to terminal for verification
puts workdays.count