FactoryGirl.define do 
  factory :game do |g|
    user
    g.name 'Game name'
    g.content 'Game content'
    g.status 'new'
  end
end