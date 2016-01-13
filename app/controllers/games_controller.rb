class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @my_games = Game.where(user_id: current_user).order("created_at desc")
    @games = Game.where("user_id <> ?", current_user).order("created_at desc")
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

  private
  def params_game
    params.require(:game).permit(:name, :content, :status, game_users_attributes: [:id, :user_id, :_destroy])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
