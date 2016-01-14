class GameUsersController < ApplicationController
  def update
    @game_user = GameUser.find(params[:id])
    @game_user.update(game_user_param)
  end

  private
  def game_user_param
    params.require(:game_user).permit(:score)
  end
end
