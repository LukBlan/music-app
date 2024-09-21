class Note < ApplicationRecord
  validates :note, presence: true

  belongs_to :user
end
