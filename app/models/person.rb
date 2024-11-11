class Person < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :pg_search, against: [:name], using: { tsearch: { prefix: true, tsvector_column: "tsv" } }

  has_many :credits

  scope :alphabetical, -> { order(name: :asc) }

  validates :name, :tmdb_id, presence: true

  enum :gender, { "Not specified" => 0, "Female" => 1, "Male" => 2, "Non-Binary" => 3 }

  def initials
    name.split.map(&:first).join
  end

  def profile?
    profile_path.present?
  end

  def profile_url(version="original")
    tmdb_image(profile_path, version)
  end

  def self.lookup(tmdb_id, **attrs)
    create_or_find_by!(tmdb_id: tmdb_id) do |person|
      person.attributes = attrs
    end
  end
end
