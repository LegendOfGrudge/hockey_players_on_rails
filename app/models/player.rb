class Player < ApplicationRecord
  validates :lastName, :skaterFullName, :positionCode, :shootsCatches, presence: true
end
