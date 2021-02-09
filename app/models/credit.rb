class Credit < ApplicationRecord
  belongs_to :media, polymorphic: true
  belongs_to :actor

  scope :ordered, -> { order(order: :asc) }

  delegate :name, :initials, :gender, :profile?, :profile_url, :profile_path, to: :actor, allow_nil: true

  def self.top_billing
    includes(:actor).first(5)
  end
end
