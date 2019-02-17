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
    column :poster, header: nil, align: :center, class: "movie-poster-column" do |tv_show|
      admin_link_to(image_tag(tv_show.poster_url("h100"), class: "movie-poster"), tv_show) if tv_show.poster?
    end
    column :name, link: true, truncate: false
    column :genres, format: :tags do |tv_show|
      tv_show.genres.map(&:name)
    end
    column :status, sort: :status, align: :center do |tv_show|
      status_tag(tv_show.status, { "Returning Series" => :success, "Ended" => :warning, "Canceled" => :danger }[tv_show.status])
    end
    column :first_air_date, align: :center
    column :last_air_date, align: :center
    column :score, sort: :vote_average, align: :center do |tv_show|
      "#{tv_show.score}%"
    end
    actions
  end

  form do |tv_show|
    tab :show do
      text_field :name
      text_area :overview, rows: 3
      select :genre_ids, TVShow::Genre.alphabetical, { label: "Genres" }, multiple: true

      divider

      text_field :homepage

      row do
        col(sm: 6) { date_field :first_air_date }
        col(sm: 6) { date_field :last_air_date }
      end
    end

    tab :backdrop do
      link_to content_tag(:figure, image_tag(tv_show.backdrop_url), class: "movie-backdrop"), tv_show.backdrop_url, data: { behavior: "zoom" }
    end if tv_show.backdrop?

    sidebar do
      form_group :poster, label: false do
        link_to image_tag(tv_show.poster_url("w500")), tv_show.poster_url, data: { behavior: "zoom" }
      end if tv_show.poster?

      static_field :tmdb, label: "TheMovieDB.org" do
        link_to tv_show.tmdb_id, tv_show.tmdb_url, target: "_blank"
      end

      static_field :status do
        status_tag(tv_show.status, { "Returning Series" => :success, "Ended" => :warning, "Canceled" => :danger }[tv_show.status])
      end

      divider

      static_field :score do
        "#{tv_show.score}% (#{pluralize(tv_show.vote_count, 'vote')})"
      end
    end
  end
end
