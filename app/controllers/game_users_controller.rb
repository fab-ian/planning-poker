class GameUsersController < ApplicationController
  expose(:game_user, attributes: :game_user_param)

  def update
    game_user.save
  end

  private
  def game_user_param
    params.require(:game_user).permit(:score)
  end
end
