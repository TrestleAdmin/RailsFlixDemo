Trestle.resource(:administrators, model: Trestle.config.auth.user_class, scope: Auth) do
  menu do
    group :configuration, priority: :last do
      item :administrators, icon: "fa fa-user-lock", priority: :last
    end
  end

  table do
    column :avatar, header: false do |administrator|
      avatar_for(administrator)
    end
    column :email, link: true
    column :first_name
    column :last_name
    actions do |a|
      a.delete unless a.instance == current_user || a.instance.demo?
    end
  end

  form do |administrator|
    text_field :email

    row do
      col(sm: 6) { text_field :first_name }
      col(sm: 6) { text_field :last_name }
    end

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end
  end
end
