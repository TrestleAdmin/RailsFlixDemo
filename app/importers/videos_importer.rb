class VideosImporter
  def initialize(base)
    @base = base
  end

  def import(tmdbs)
    tmdbs.each do |tmdb|
      @base.videos.create!(name: tmdb.name, site: tmdb.site, video_type: tmdb.type, key: tmdb.key)
    end
  end
end
