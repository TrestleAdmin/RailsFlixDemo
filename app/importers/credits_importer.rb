class CreditsImporter
  def initialize(base)
    @base = base
  end

  def import(tmdbs)
    tmdbs.each do |tmdb|
      actor = Actor.where(tmdb_id: tmdb.id).first_or_create!(name: tmdb.name, gender: tmdb.gender, profile_path: tmdb.profile_path)
      @base.credits.create!(actor: actor, order: tmdb.order, character: tmdb.character)
    end
  end
end
