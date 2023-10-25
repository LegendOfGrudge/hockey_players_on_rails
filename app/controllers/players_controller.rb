class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @performances = PlayerPerformance.where(:player_id => params[:id])
    @teams = TeamPlayer.where(:player_id => params[:id])
  end
end
