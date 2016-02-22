FactoryGirl.define do
  factory :user do
    firstName "Milo"
    lastName "Bloom"
    sequence(:email) { |n| "milo#{n}@email.com"}
    pin 1234
    role "Crew"
    password "password"
    password_confirmation "password"
  end
end
