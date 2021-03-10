FactoryBot.define do
  factory :user do
    name { "karen" }
    email { "kkk@example.com" }
    password { "password1" }
    password_confirmation { "password1" }
    admin { false }
  end

  factory :admin_user, class: User do
    name { "oomiya" }
    email { "oomiya@example" }
    password { "password2" }
    password_confirmation { "password2" }
    admin { true }
  end
end
