FactoryGirl.define do
  factory :user do
    firstName { Faker::Name.first_name }
    lastName { Faker::Name.last_name }
    email { Faker::Internet.email }
    pin { Faker::Number.number(4) }
    role "Crew"
    password "password"
    password_confirmation "password"
    account
    # project
  end
end
