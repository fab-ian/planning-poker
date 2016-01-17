FactoryGirl.define do 
  factory :user do |u| 
    u.name Faker::Name.first_name
    u.surname Faker::Name.last_name
    u.sequence(:email) {|n| "user#{n}@example.com"}
    u.password 'player16'
    u.role 'player'
  end
end