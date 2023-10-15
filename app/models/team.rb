class Team < ApplicationRecord
  validates :teamAbbrevs, presence: true, uniqueness: true
end
