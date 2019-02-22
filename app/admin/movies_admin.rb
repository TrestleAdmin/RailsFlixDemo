Trestle.resource(:movies) do
  menu do
    group :library do
      item :movies, icon: "fa fa-film"
    end
  end

  collection do
    model.includes(:genres)
  end

  search do |query|
    query ? collection.pg_search(query) : collection
  end

  table do
    column :poster, header: nil, align: :center, class: "poster-column" do |movie|
      admin_link_to(image_tag(movie.poster_url("w154"), class: "poster"), movie) if movie.poster?
    end
    column :title, link: true, sort: :title do |movie|
      safe_join([
        content_tag(:strong, movie.title),
        content_tag(:small, movie.credits.top_billing.map(&:name).join(", "), class: "text-muted hidden-xs")
      ], "<br />".html_safe)
    end
    column :genres, format: :tags, class: "hidden-xs" do |movie|
      movie.genres.map(&:name)
    end
    column :status, sort: :status, align: :center do |movie|
      status_tag(movie.status, { "Released" => :success, "Canceled" => :danger }[movie.status] || :default)
    end
    column :release_date, align: :center
    column :score, sort: :vote_average, align: :center do |movie|
      "#{movie.score}%"
    end
    actions
  end

  form do |movie|
    tab :movie do
      text_field :title
      text_field :tagline
      text_area :overview, rows: 5
      select :genre_ids, Movie::Genre.alphabetical, { label: "Genres" }, multiple: true

      divider

      text_field :homepage

      row do
        col(sm: 4) { text_field :runtime, append: "min" }
        col(sm: 4) { text_field :budget, prepend: "$" }
        col(sm: 4) { text_field :revenue, prepend: "$" }
      end
    end

    tab :credits, badge: movie.credits.count do
      table CreditsAdmin.table, collection: movie.credits.includes(:actor)
    end

    tab :media, partial: "admin/shared/media", badge: movie.media_count

    sidebar do
      form_group :poster, label: false do
        link_to image_tag(movie.poster_url("w500")), movie.poster_url, data: { behavior: "zoom" }
      end if movie.poster?

      static_field :tmdb, label: "TheMovieDB.org" do
        link_to movie.tmdb_id, movie.tmdb_url, target: "_blank"
      end if movie.tmdb_id?

      static_field :imdb, label: "IMDB.com" do
        link_to movie.imdb_id, movie.imdb_url, target: "_blank"
      end if movie.imdb_id?

      select :status, Movie::STATUSES

      date_field :release_date

      if movie.persisted?
        divider

        static_field :score do
          "#{movie.score}% (#{pluralize(movie.vote_count, 'vote')})"
        end
      end
    end
  end
end
