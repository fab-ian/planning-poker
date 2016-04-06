class InvitationsController < ApplicationController
  before_action :authenticate_user!, except: [:accept]
  expose(:invitation)

  def create
    return if User.find_by(email: invitation_params[:email]).present?

    invitation.transaction do
      game_id = invitation_params[:game_id]
      email = invitation_params[:email]
      full_name = invitation_params[:name] + " " + invitation_params[:surname]
      password = '12345678'

      u = User.new
      u.name = invitation_params[:name]
      u.surname = invitation_params[:surname]
      u.email = email
      u.password = password 

      if u.save 
        u.assignments.create(role_id: 2) #role = user

        invitation.from_user_id = current_user.id
        invitation.to_user_id = u.id
        invitation.game_id = game_id

        if invitation.save
          InvitationMailer.invite(email, full_name, invitation.id, password).deliver_now
          redirect_to root_url, notice: 'Invitation was send successfully'
        else
          redirect_to root_url, notice: 'Invitation wasn\'t send successfully'
        end
      else
        render :new, notice: 'User wasn\'t successfully added'
      end
    end
  end

  def accept
    gu = GameUser.new(user_id: invitation.to_user_id, game_id: invitation.game_id)
    @ok = gu.save
    @user_games = User.user_games(invitation.to_user_id)
  end

  private
  def invitation_params
    params.permit(:name, :surname, :email, :game_id)
  end
end
