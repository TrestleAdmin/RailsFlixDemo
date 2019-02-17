class Genre < ApplicationRecord
  scope :alphabetical, -> { order(name: :asc) }

  validates :name, presence: true
end
