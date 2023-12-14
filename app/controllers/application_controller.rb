class ApplicationController < ActionController::Base
  before_action :search_teams

  # Added a teams category for the dropdown to select by
  def search_teams
    @search_categories = Team.all
  end
end
