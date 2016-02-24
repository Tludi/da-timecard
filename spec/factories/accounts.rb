FactoryGirl.define do
  factory :account do
    name { Faker::Company.name }
    time_zone { Faker::Address.time_zone }
    # addressStreet { Faker::Address.street_address }
    # addressCity { Faker::Address.city }
    # addressState { Faker::Address.state }
    # addressZip { Faker::Address.zip_code }
    # addressCountry { Faker::Address.country }
    # companyPhone { Faker::PhoneNumber.phone_number } #=> "397.693.1309"
    # companyContact { Faker::Superhero.name }
    # companyWebsite { Faker::Internet.url }
  end
end
