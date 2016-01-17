class Game < ActiveRecord::Base
  has_many :game_users, dependent: :destroy
  has_many :users, through: :game_users
  belongs_to :user
  
  accepts_nested_attributes_for :game_users, allow_destroy: true

  scope :my_games, -> (p){where(user_id: p).order("created_at desc")}

  def self.status
    %w[new active completed]
  end

  def self.not_my_games(user_id)
    query = <<-SQL
      select g.id, g.name, g.content, g.status, g.user_id from games as g 
      join game_users as gu on gu.game_id = g.id 
      where g.user_id <> #{user_id}
      and gu.user_id = #{user_id}
      and g.status = 'active'
    SQL

    self.find_by_sql(query)
  end
end
