class Person < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :pg_search, against: [:name], using: { tsearch: { prefix: true, tsvector_column: "tsv" } }

  has_many :credits

  scope :alphabetical, -> { order(name: :asc) }

  validates :name, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  enum gender: { "Not specified" => 0, "Female" => 1, "Male" => 2, "Non-Binary" => 3 }

  def initials
    name.split.map(&:first).join
  end

  def profile?
    profile_path.present?
  end

  def profile_url(version="original")
    tmdb_image(profile_path, version)
  end
end
