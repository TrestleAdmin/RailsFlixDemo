Trestle.resource(:genres) do
  menu do
    group :configuration, priority: :last do
      item :genres, icon: "fa fa-star"
    end
  end

  collection do
    model.alphabetical
  end

  table do
    column :name, link: true
    column :media
  end

  form do |genre|
    text_field :name
  end
end
