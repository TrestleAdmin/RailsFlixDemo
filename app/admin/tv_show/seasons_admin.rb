Trestle.resource(:seasons, scope: TVShow) do
  table do
    column :poster, header: nil, align: :center, class: "poster-column", blank: "" do |season|
      image_tag(season.poster_url("h100"), class: "poster") if season.poster?
    end
    column :name, link: true, truncate: false
    column :episode_count, align: :center, header: "Episodes"
    column :air_date, align: :center
    actions
  end

  form modal: { class: "modal-lg" } do |season|
    row do
      col(sm: 4) do
        form_group :poster, label: false do
          link_to image_tag(season.poster_url("w500")), season.poster_url, data: { controller: "lightbox" }
        end if season.poster?
      end

      col(sm: 8) do
        row do
          col(sm: 2) { text_field :number, label: "#" }
          col(sm: 10) { text_field :name }
        end

        text_area :overview, rows: 5

        row do
          col(sm: 4) { text_field :episode_count, label: "Episodes" }
          col(sm: 8) { date_field :air_date }
        end

        static_field :tmdb, label: "TheMovieDB.org" do
          link_to season.tmdb_id, season.tmdb_url, target: "_blank"
        end if season.tmdb_id?
      end
    end
  end
end
