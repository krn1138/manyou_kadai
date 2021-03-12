FactoryBot.define do
  factory :user, class: User do
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

  factory :usertwo, class: User do
    name { "tarou" }
    email { "tarou@example" }
    password { "password3" }
    password_confirmation { "password3" }
    admin { false }
  end
end
