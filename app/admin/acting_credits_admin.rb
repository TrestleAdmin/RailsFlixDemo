Trestle.resource(:acting_credits) do
  form modal: true do |credit|
    row do
      col(sm: 4) do
        form_group :profile, label: false do
          link_to image_tag(credit.profile_url), credit.profile_url, data: { controller: "lightbox" }
        end if credit.profile?
      end

      col(sm: 8) do
        select :person_id, Person.alphabetical

        row do
          col(sm: 9) { text_field :character }
          col(sm: 3) { text_field :order }
        end
      end
    end
  end

  table do
    column :profile, header: false, align: :center, blank: nil do |credit|
      avatar(fallback: credit.initials) { image_tag(credit.profile_url("w185")) if credit.profile? }
    end
    column :name, link: true
    column :character, truncate: false
  end
end
