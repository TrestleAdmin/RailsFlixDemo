class ImagesImporter
  def initialize(base)
    @base = base
  end

  def import(tmdbs, type)
    tmdbs.each do |tmdb|
      @base.images.create!(image_type: type, file_path: tmdb.file_path)
    end
  end
end
