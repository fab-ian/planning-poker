class User < ActiveRecord::Base
  has_many :game_users
  has_many :game, through: :game_users
  has_many :games

  scope :all_name_asc, -> {all.order("name asc").decorate}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email, presence: true

  def to_s
    "#{name} #{surname}"
  end
end
