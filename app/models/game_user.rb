class GameUser < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  scope :get_users, -> (p){includes(:user).where(game_id: p)}
end
