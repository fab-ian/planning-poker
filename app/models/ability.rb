class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

    if @user.roles.size == 0
      can :read, :all #for guest without roles
    end
  end

  def admin
    can :manage, :all
    can :access, :rails_admin   # grant access to rails_admin
    can :dashboard      
  end

  def user
    can :manage, Game
    can :manage, GameUser
  end
end
