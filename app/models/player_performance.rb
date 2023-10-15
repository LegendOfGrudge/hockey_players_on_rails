class PlayerPerformance < ApplicationRecord
  belongs_to :player
  belongs_to :season

  validates :evGoals, :evPoints, :gameWinningGoals, :gamesPlayed, :goals, :otGoals, :penaltyMinutes, :plusMinus, :points, :ppGoals, :ppPoints, :shGoals, :shots, numericality: { only_integers: true }
  validates :pointsPerGame, :shootingPct, :timeOnIcePerGame, numericality: true
end
