FactoryGirl.define do
  factory :project do
    name { Faker::Name.name }
    # addressStreet { Faker::Address.street_address }
    # addressCity { Faker::Address.city }
    # addressState { Faker::Address.state }
    # addressZip { Faker::Address.zip_code }
    # projectContact { Faker::Superhero.name }
    # projectContactPhone { Faker::PhoneNumber.phone_number } #=> "397.693.1309"
    account
  end
end
