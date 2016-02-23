FactoryGirl.define do
  factory :workday do
    association :user
    hoursWorked 8  
    dayDate "Feb 22, 2016" 
    notes "Need more chocolate"
  end
end
