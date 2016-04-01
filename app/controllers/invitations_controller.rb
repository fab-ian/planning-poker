class InvitationsController < ApplicationController
  expose(:invitation)

  def new
    @game_id = params[:id]
  end

  def create
    game_id = invitation_params[:game_id]

    u = User.new
    u.name = invitation_params[:name]
    u.surname = invitation_params[:surname]
    u.email = invitation_params[:email]
    u.password = '12345678'

    if u.save 
      u.assignments.create(role_id: 2)

      invitation.from_user_id = current_user.id
      invitation.to_user_id = u.id
      invitation.game_id = game_id
      if invitation.save
        redirect_to root_url, notice: 'Invitation was send successfully'
      else
        redirect_to root_url, notice: 'Invitation wasn\'t send successfully'
      end
    else
      redirect_to invitation_path(game_id), notice: 'User wasn\'t successfully added'
    end
  end

  def accept
  end

  private
  def invitation_params
    params.permit(:name, :surname, :email, :game_id)
  end
end
