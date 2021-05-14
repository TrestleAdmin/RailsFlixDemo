require 'throttler'

class TmdbImporter
  REQUESTS_PER_SECOND = 4

  def initialize(scope:, importer:, pages:)
    @scope, @importer, @pages = scope, importer, pages
    @throttle = Throttler.new(REQUESTS_PER_SECOND)
  end

  def import
    (1..@pages).each do |page|
      popular = throttle { @scope.popular(page: page) }

      popular.results.each do |stub|
        tmdb = throttle { @scope.detail(stub.id) }

        yield tmdb

        instance = @importer.import(tmdb)

        threads = []

        threads << Thread.new {
          credits = throttle { @scope.cast(stub.id) }
          CreditsImporter.new(instance).import(credits)
        }

        threads << Thread.new {
          crew = throttle { @scope.crew(stub.id) }
          CrewImporter.new(instance).import(crew)
        }

        threads << Thread.new {
          videos = throttle { @scope.videos(stub.id, language: "en") }
          VideosImporter.new(instance).import(videos)
        }

        threads << Thread.new {
          posters = throttle { @scope.posters(stub.id, language: "en") }
          ImagesImporter.new(instance).import(posters, "Poster")
        }

        threads << Thread.new {
          backdrops = throttle { @scope.backdrops(stub.id, language: "en") }
          ImagesImporter.new(instance).import(backdrops, "Backdrop")
        }

        threads.each(&:join)
      end
    end
  end

private
  def throttle
    @throttle.t { yield }
  rescue Tmdb::Error
    sleep 10
    retry
  end
end
