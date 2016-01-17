FactoryGirl.define do 
  factory :game_user do |gu|
    game
    user
    score 0
  end
end
