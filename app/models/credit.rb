class Credit < ApplicationRecord
  belongs_to :media, polymorphic: true
  belongs_to :actor

  scope :ordered, -> { order(order: :asc) }

  delegate :name, :initials, :gender, :profile?, :profile_url, :profile_path, to: :actor
end
