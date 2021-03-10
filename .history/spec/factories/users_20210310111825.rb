FactoryBot.define do
  factory :admin_user, class: User do
    name { "karen" }
    email { "kkk@example.com" }
    password { "password1" }
    password_confirmation { "password1" }
    admin { true }
  end

  factory :user, class: User do
    name { "oomiya" }
    email { "oomiya@example" }
    password { "password2" }
    password_confirmation { "password2" }
    admin { false }
  end
end
