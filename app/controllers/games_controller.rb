class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @game.game_users.new
  end

  def create
    @game = Game.new(params_game)

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
    params.require(:game).permit(:name, :content, game_users_attributes: [:id, :user_id])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
