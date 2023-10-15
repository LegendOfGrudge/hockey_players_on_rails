class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players

  validates :lastName, :skaterFullName, :positionCode, :shootsCatches, presence: true
end
