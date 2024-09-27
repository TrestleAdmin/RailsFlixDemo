class Genre < ApplicationRecord
  scope :alphabetical, -> { order(name: :asc) }

  validates :name, presence: true, uniqueness: { scope: :type }
end
