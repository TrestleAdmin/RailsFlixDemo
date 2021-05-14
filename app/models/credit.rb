class Credit < ApplicationRecord
  belongs_to :media, polymorphic: true
  belongs_to :person

  scope :ordered, -> { order(order: :asc) }
  scope :actors, -> { where(type: "ActingCredit") }

  delegate :name, :initials, :gender, :profile?, :profile_url, :profile_path, to: :person, allow_nil: true
end
