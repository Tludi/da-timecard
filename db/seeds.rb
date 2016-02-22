# database seed file for creating sample users each with 5 workdays


# Create 5 users
@firstNames = Array["John", "Jose", "Amy", "Pat", "Bill"]
@lastNames = Array["Smith", "Jones", "Walker", "Williams", "Jefferson"]

5.times do |i|
  User.create(firstName: @firstNames[i],
              lastName: @lastNames[i],
              email: "#{@firstNames[i]}@email.com",
              role: "Crew",
              password: "password",
              password_confirmation: "password",
              pin: 1234 )
end

User.create(firstName: "milo",
            lastName: "bloom", 
            email: "milo",
            role: "Supervisor",
            password: "password",
            password_confirmation: "password",
            pin: 1234 )

User.create(firstName: "admin",
            lastName: "admin",
            email: "admin",
            role: "Admin",
            password: "password",
            password_confirmation: "password",
            pin: 1234 )

users = User.all
# print User count to terminal for verification
puts users.count


# Create 1 workday for each User
users.each do |u|
  u.workdays.create(hoursWorked: 8,
                    user_id: u.id,
                    dayDate: (DateTime.now - 1).to_date , # set each day backwards by 24 hours
                    project_id: 1,
                    notes: "Nothing yet" )
end

workdays = Workday.all
# print workday count to terminal for verification
puts workdays.count

Project.create(name: "General Work")
Project.create(name: "Willamette House")
Project.create(name: "Portland House")
Project.create(name: "Tigard House")
