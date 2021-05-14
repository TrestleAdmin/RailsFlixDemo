Trestle.resource(:crew_credits) do
  form dialog: true do |credit|
    row do
      col(sm: 4) do
        form_group :profile, label: false do
          link_to image_tag(credit.profile_url), credit.profile_url, data: { behavior: "zoom" }
        end if credit.profile?
      end

      col(sm: 8) do
        select :person_id, Person.alphabetical
        text_field :job
      end
    end
  end

  table do
    column :profile, header: false, align: :center, blank: nil do |credit|
      avatar(fallback: credit.initials) { image_tag(credit.profile_url("w185")) if credit.profile? }
    end
    column :name, link: true
    column :job, truncate: false
  end
end
