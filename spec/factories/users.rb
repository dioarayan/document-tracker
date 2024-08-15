FactoryBot.define do
  factory :user1, class: User do
    username { "user1" }
    email { "user1@example.com" }
    admin { true }
    password { "averysecurepassword" }

    factory :secretary, class: User do
      username { "secretary" }
      email { "secretary@test.com" }
    end
  end
end
