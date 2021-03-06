class Game < ActiveRecord::Base
  has_many :game_users, dependent: :destroy
  has_many :users, through: :game_users
  belongs_to :user
  
  validates :name, :content, presence: true

  accepts_nested_attributes_for :game_users, allow_destroy: true

  scope :my_games, -> (p){where("user_id = ?", p).order("created_at desc")}

  after_create :increment_game
  after_destroy :decrement_game

  def self.status
    %w[new active completed]
  end

  def self.not_my_games(user_id)
    find_by_sql <<-SQL
      select g.id, g.name, g.content, g.status, g.user_id from games as g 
      join game_users as gu on gu.game_id = g.id 
      where g.user_id <> #{user_id}
      and gu.user_id = #{user_id}
      and g.status = 'active'
    SQL
  end

  def increment_game
    $GAMES += 1
  end

  def decrement_game
    $GAMES -= 1
  end
end
