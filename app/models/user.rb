class User < ActiveRecord::Base
  has_many :game_users
  has_many :game, through: :game_users
  has_many :games
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :invitations, class_name: 'Invitation', foreign_key: :from_user_id
  has_many :invitations, class_name: 'Invitation', foreign_key: :to_user_id

  scope :all_name_asc, -> {all.order("name asc").decorate}
  scope :user_games, -> (user_id){find(user_id).game_users.includes(:game).map {|gu| [gu.game_id, gu.game.name]}}

  after_save :increment_user
  after_destroy :decrement_user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email, presence: true

  def to_s
    "#{name} #{surname}"
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def increment_user
    $USERS += 1
  end

  def decrement_user
    $USERS -= 1
  end
end
