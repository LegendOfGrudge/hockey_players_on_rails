class SearchController < ApplicationController
  def search
    @query = params[:query]
    @category = params[:team]

    if @query.blank?
      flash[:alert] = "Please enter a player's name."
      redirect_to search_path
    else
      if @category.blank?
        @results = Player.where("skaterFullName LIKE ?", "%#{sanitize_sql_like(@query)}%")

        if @results.empty?
          flash[:notice] = "No results found."
        end
      else
        # Finds all team players by the provided team id to narrow down the search
        team_players = TeamPlayer.where(team_id: @category["id"])

        # Searches through the team players list to find any Players who match the query
        @results = Player.joins(:team_players)
                        .where(team_players: { id: team_players })
                        .where("skaterFullName LIKE ?", "%#{sanitize_sql_like(@query)}%")

        if @results.empty?
          flash[:notice] = "No results found."
        end
      end
    end
  end

  private

  def sanitize_sql_like(str)
    ActiveRecord::Base.sanitize_sql_like(str)
  end
end