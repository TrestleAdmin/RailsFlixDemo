class Genre < ApplicationRecord
  scope :alphabetical, -> { order(name: :asc) }

  validates :name, presence: true

  def media
    self.class.parent.name
  end
end
