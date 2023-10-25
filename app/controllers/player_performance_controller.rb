class PlayerPerformanceController < ApplicationController
  def index
    @playerPerformances = PlayerPerformance.page params[:page]
  end
end
