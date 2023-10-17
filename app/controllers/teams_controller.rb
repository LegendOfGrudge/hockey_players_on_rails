class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @players = TeamPlayer.where(:team_id => params[:id])
  end
end
