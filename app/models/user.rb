class User < ActiveRecord::Base
  has_many :game_users
  has_many :game, through: :game_users
  has_many :games
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :invitations, class_name: 'Invitation', foreign_key: :from_user_id
  has_many :invitations, class_name: 'Invitation', foreign_key: :to_user_id

  scope :all_name_asc, -> {all.order("name asc").decorate}

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
end
