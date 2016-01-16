class Game < ActiveRecord::Base
  has_many :game_users, dependent: :destroy
  has_many :users, through: :game_users
  belongs_to :user
  
  accepts_nested_attributes_for :game_users, allow_destroy: true

  scope :my_games, -> (p){where(user_id: p).order("created_at desc")}
  scope :not_my_games, -> (p){Game.find_by_sql(
      "select g.id, g.name, g.content, g.status, g.user_id from games as g "\
      "left join game_users as gu on gu.game_id = g.id "\
      "where g.user_id <> #{p.id} "\
      "and gu.user_id = #{p.id} "\
      "and g.status = 'active' "\
    )}

  def self.status
    %w[new active completed]
  end
end
