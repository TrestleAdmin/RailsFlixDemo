require 'throttler'

class TmdbImporter
  REQUESTS_PER_SECOND = 4

  def initialize(scope:, importer:, pages:)
    @scope, @importer, @pages = scope, importer, pages
    @throttle = Throttler.new(REQUESTS_PER_SECOND)
  end

  def import
    (1..@pages).each do |page|
      popular = @throttle.t { @scope.popular(page: page) }

      popular.results.each do |stub|
        tmdb = @throttle.t { @scope.detail(stub.id) }

        yield tmdb

        instance = @importer.import(tmdb)

        threads = []

        threads << Thread.new {
          credits = @throttle.t { @scope.cast(stub.id) }
          CreditsImporter.new(instance).import(credits)
        }

        threads << Thread.new {
          videos = @throttle.t { @scope.videos( stub.id, language: "en") }
          VideosImporter.new(instance).import(videos)
        }

        threads << Thread.new {
          posters = @throttle.t { @scope.posters(stub.id, language: "en") }
          ImagesImporter.new(instance).import(posters, "Poster")
        }

        threads << Thread.new {
          backdrops = @throttle.t { @scope.backdrops(stub.id, language: "en") }
          ImagesImporter.new(instance).import(backdrops, "Backdrop")
        }

        threads.each(&:join)
      end
    end
  end
end
