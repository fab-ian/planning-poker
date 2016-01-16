class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @my_games = Game.my_games(current_user)
    @games = Game.not_my_games(current_user)
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.new(params_game)

    if @game.save!
      redirect_to game_url(@game), notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def update
    if @game.update(params_game)
      redirect_to game_url(@game), notice: 'Game was successfully updated'
    else
      render :new
    end        
  end  

  def destroy
    if @game.destroy
      redirect_to games_url, notice: 'Game was successfully destroy'
    else
      redirect_to games_url, notice: 'Game wasn\'t successfully destroy'      
    end
  end

  def show
    @fibonacci = [1, 2, 3, 5, 8, 13, 21, 34, 56]
    @game_user = GameUser.find_by(game_id: params[:id], user_id: current_user.id)
    @game.user_id == current_user.id ? @are_this_my_games = true : @are_this_my_games = false

    if @game.status == 'completed' || @are_this_my_games
      cvr = CalculateVoteResult.new(params[:id])
      @vote_result = cvr.get
    end
  end

  private
  def params_game
    params.require(:game).permit(:name, :content, :status, game_users_attributes: [:id, :user_id, :_destroy])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
