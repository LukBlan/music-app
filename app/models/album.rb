class Album < ApplicationRecord
  RECORD_TYPES = [
    "studio",
    "live"
  ]

  attr_reader :record_type
  validates :title, :year, presence: true
  validates :record_type, inclusion: RECORD_TYPES
  before_save :set_studio

  has_many :tracks, dependent: :destroy
  belongs_to :band

  def record_type=(record_type)
    @record_type = record_type
  end

  def set_studio
    self.studio = (@record_type == "studio")
  end

end
