class SearchController < ApplicationController
  def search
    @query = params[:query]

    if @query.blank?
      flash[:alert] = "Please enter a player's name."
      redirect_to search_path
    else
      # Use ActiveRecord to build a safe query
      @results = Player.where("skaterFullName LIKE ?", "%#{sanitize_sql_like(@query)}%")

      if @results.empty?
        flash[:notice] = "No results found."
      end
    end
  end

  private

  def sanitize_sql_like(str)
    ActiveRecord::Base.sanitize_sql_like(str)
  end
end