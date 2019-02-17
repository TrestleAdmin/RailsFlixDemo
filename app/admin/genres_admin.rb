Trestle.resource(:genres) do
  menu do
    group :configuration, priority: :last do
      item :genres, icon: "fa fa-star"
    end
  end

  scope :movies, -> { Genre.where(type: "Movie::Genre") }, default: true
  scope :tv_shows, -> { Genre.where(type: "TVShow::Genre") }

  collection do
    model.alphabetical
  end

  table do
    column :name, link: true
    column :media, sort: :type
    actions
  end

  form dialog: true do |genre|
    select :type, { "Movie" => "Movie::Genre", "TV Show" => "TVShow::Genre" }
    text_field :name
  end
end
