Trestle.resource(:movies) do
  menu do
    group :library do
      item :movies, icon: "fa fa-film"
    end
  end

  collection do
    model.includes(:genres)
  end

  table do
    column :poster, header: nil, align: :center, class: "movie-poster-column" do |movie|
      admin_link_to(image_tag(movie.poster_url("h100"), class: "movie-poster"), movie) if movie.poster?
    end
    column :title, link: true, truncate: false
    column :genres, format: :tags do |movie|
      movie.genres.map(&:name)
    end
    column :status, sort: :status, align: :center do |movie|
      status_tag(movie.status, { "Released" => :success, "Post Production" => :warning }[movie.status])
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
      text_area :overview, rows: 3
      select :genre_ids, Movie::Genre.alphabetical, { label: "Genres" }, multiple: true

      divider

      text_field :homepage

      row do
        col(sm: 4) { text_field :runtime, append: "min" }
        col(sm: 4) { text_field :budget, prepend: "$" }
        col(sm: 4) { text_field :revenue, prepend: "$" }
      end
    end

    tab :backdrop do
      link_to content_tag(:figure, image_tag(movie.backdrop_url), class: "movie-backdrop"), movie.backdrop_url, data: { behavior: "zoom" }
    end if movie.backdrop?

    sidebar do
      form_group :poster, label: false do
        link_to image_tag(movie.poster_url("w500")), movie.poster_url, data: { behavior: "zoom" }
      end if movie.poster?

      static_field :tmdb, label: "TheMovieDB.org" do
        link_to movie.tmdb_id, movie.tmdb_url, target: "_blank"
      end

      static_field :imdb, label: "IMDB.com" do
        link_to movie.imdb_id, movie.imdb_url, target: "_blank"
      end

      static_field :status do
        status_tag(movie.status, { "Released" => :success, "Post Production" => :warning }[movie.status])
      end

      date_field :release_date

      divider

      static_field :score do
        "#{movie.score}% (#{pluralize(movie.vote_count, 'vote')})"
      end
    end
  end
end
