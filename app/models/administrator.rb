class Administrator < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable

  # Prevent demo user from being modified
  validate on: :update do
    errors.add(:email, "Cannot change login details for demo user") if demo? && email_changed?
    errors.add(:password, "Cannot change login details for demo user") if demo? && password_digest_changed?
  end

  before_destroy if: :demo? do
    throw(:abort)
  end

  def demo?
    email_was == "demo@example.com"
  end
end
