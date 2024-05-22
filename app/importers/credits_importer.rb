class CreditsImporter
  def initialize(base)
    @base = base
  end

  def import(tmdbs)
    tmdbs.each do |tmdb|
      person = Person.lookup(tmdb.id, name: tmdb.name, gender: tmdb.gender, profile_path: tmdb.profile_path)
      @base.acting_credits.create!(person: person, order: tmdb.order, character: tmdb.character)
    end
  end
end
