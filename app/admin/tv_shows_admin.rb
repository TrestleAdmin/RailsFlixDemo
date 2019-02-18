Trestle.resource(:tv_shows, model: TVShow) do
  menu do
    group :library do
      item :tv_shows, icon: "fa fa-television", label: "TV Shows"
    end
  end

  collection do
    model.includes(:genres)
  end

  table do
    column :poster, header: nil, align: :center, class: "poster-column" do |tv_show|
      admin_link_to(image_tag(tv_show.poster_url("w154"), class: "poster"), tv_show) if tv_show.poster?
    end
    column :title, link: true do |tv_show|
      safe_join([
        content_tag(:strong, tv_show.name),
        content_tag(:small, tv_show.credits.top_billing.map(&:name).join(", "), class: "text-muted hidden-xs")
      ], "<br />".html_safe)
    end
    column :genres, format: :tags, class: "hidden-xs" do |tv_show|
      tv_show.genres.map(&:name)
    end
    column :status, sort: :status, align: :center do |tv_show|
      status_tag(tv_show.status, { "Returning Series" => :success, "Pilot" => :warning, "Ended" => :danger, "Canceled" => :danger }[tv_show.status] || :default)
    end
    column :first_air_date, align: :center
    column :last_air_date, align: :center
    column :score, sort: :vote_average, align: :center do |tv_show|
      "#{tv_show.score}%"
    end
    actions
  end

  form do |tv_show|
    tab :tv_show do
      text_field :name
      text_area :overview, rows: 5
      select :genre_ids, TVShow::Genre.alphabetical, { label: "Genres" }, multiple: true

      divider

      text_field :homepage

      row do
        col(sm: 6) { date_field :first_air_date }
        col(sm: 6) { date_field :last_air_date }
      end
    end

    tab :credits, badge: tv_show.credits.count do
      table CreditsAdmin.table, collection: tv_show.credits.includes(:actor)
    end

    tab :seasons, badge: tv_show.seasons.count do
      table TVShow::SeasonsAdmin.table, collection: tv_show.seasons
    end

    tab :media, partial: "admin/shared/media", badge: tv_show.media_count

    tab :backdrop do
      link_to content_tag(:figure, image_tag(tv_show.backdrop_url), class: "movie-backdrop"), tv_show.backdrop_url, data: { behavior: "zoom" }
    end if tv_show.backdrop?

    sidebar do
      form_group :poster, label: false do
        link_to image_tag(tv_show.poster_url("w500")), tv_show.poster_url, data: { behavior: "zoom" }
      end if tv_show.poster?

      static_field :tmdb, label: "TheMovieDB.org" do
        link_to tv_show.tmdb_id, tv_show.tmdb_url, target: "_blank"
      end if tv_show.tmdb_id?

      select :status, TVShow::STATUSES

      if tv_show.persisted?
        divider

        static_field :score do
          "#{tv_show.score}% (#{pluralize(tv_show.vote_count, 'vote')})"
        end
      end
    end
  end
end
