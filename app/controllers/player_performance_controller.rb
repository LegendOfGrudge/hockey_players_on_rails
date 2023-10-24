class PlayerPerformanceController < ApplicationController
  def index
    @playerPerformances = PlayerPerformance.all
  end
end
