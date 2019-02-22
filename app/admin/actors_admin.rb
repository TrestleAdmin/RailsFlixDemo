Trestle.resource(:actors) do
  menu do
    group :library do
      item :actors, icon: "fa fa-male", priority: :last
    end
  end

  collection do
    model.alphabetical
  end

  search do |query|
    query ? collection.pg_search(query).reorder(nil) : collection
  end

  decorate_collection do |collection|
    collection.group(:id).left_outer_joins(:credits).select("actors.*, COUNT(credits.actor_id) AS credits_count")
  end

  sort_column(:credits_count) do |collection, order|
    collection.reorder("credits_count #{order}")
  end

  table do
    column :profile, header: false, align: :center, blank: nil do |actor|
      avatar(fallback: actor.initials) { image_tag(actor.profile_url("w185")) if actor.profile? }
    end
    column :name, link: true
    column :gender, align: :center, sort: :gender do |actor|
      status_tag(actor.gender)
    end
    column :credits_count, header: "Credits", align: :center
    actions
  end

  form dialog: true do |actor|
    row do
      col(sm: 4) do
        form_group :profile, label: false do
          link_to image_tag(actor.profile_url), actor.profile_url, data: { behavior: "zoom" }
        end if actor.profile?
      end

      col(sm: 8) do
        text_field :name
        select :gender, Actor.genders.keys.map { |w| [w.humanize, w] }
      end
    end
  end
end
