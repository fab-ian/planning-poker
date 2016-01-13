class Game < ActiveRecord::Base
  has_many :game_users, dependent: :destroy
  has_many :users, through: :game_users

  accepts_nested_attributes_for :game_users, allow_destroy: true
end
