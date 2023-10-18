class Season < ApplicationRecord
  has_many :player_performances
  has_many :players, through: :player_performances

  validates :years, presence: true, uniqueness: true
end
