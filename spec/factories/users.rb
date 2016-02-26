FactoryGirl.define do
  factory :user do
    firstName { Faker::Name.first_name }
    lastName { Faker::Name.last_name }
    email { Faker::Internet.email }
    pin 1234
    role "Crew"
    password "password"
    password_confirmation "password"
    account
    # project

    factory :admin do
      role "Admin"
    end

    factory :crew do
      role "Crew"
    end

  end

end
