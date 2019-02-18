class Video < ApplicationRecord
  belongs_to :media, polymorphic: true

  def url
    case site
    when "YouTube"
      "https://www.youtube.com/watch?v=#{key}"
    end
  end

  def thumbnail
    case site
    when "YouTube"
      "https://img.youtube.com/vi/#{key}/hqdefault.jpg"
    end
  end
end
