class HomeController < ApplicationController
  def index
    @players = PlayerPerformance.all.limit(10)
  end
end
