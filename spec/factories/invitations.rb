FactoryGirl.define do
  factory :invitation do
    game
    association :from_user_id, factory: :user
    association :to_user_id, factory: :user
  end
end
