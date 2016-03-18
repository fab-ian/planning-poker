class GameUsersController < ApplicationController
  expose(:game_user, attributes: :game_user_param)

  def update
    # @game_user = GameUser.find(params[:id])
    # game_user.update(game_user_param)
    game_user.save
  end

  private
  def game_user_param
    params.require(:game_user).permit(:score)
  end
end
