class Season < ApplicationRecord
  validates :years, presence: true, uniqueness: true
end
