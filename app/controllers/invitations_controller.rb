class InvitationsController < ApplicationController
  expose(:invitation, attributes: :invitation_params)

  def create
  end

  def accept
  end

  private
  def invitation_params
    params.require(:invitation).permit(:name, :surname, :email)
  end
end
