class Track < ApplicationRecord
  TRACK_TYPES = [
    "regular",
    "bonus"
  ]

  validates :title, :ord, :track_type, presence: true
  validates :track_type, inclusion: TRACK_TYPES

  has_many :notes
  belongs_to :album
end
