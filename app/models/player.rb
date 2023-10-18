class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players

  has_many :player_performances
  has_many :seasons, through: :player_performances

  validates :lastName, :skaterFullName, :positionCode, :shootsCatches, presence: true
end