class CreditsImporter
  def initialize(base)
    @base = base
  end

  def import(tmdbs)
    tmdbs.each do |tmdb|
      Actor.where(tmdb_id: tmdb.id).first_or_create!(name: tmdb.name, gender: tmdb.gender, profile_path: tmdb.profile_path)
    end
  end
end
