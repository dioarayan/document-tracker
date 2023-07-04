FactoryBot.define do
  factory :user1, class: User do
    # association :document, factory: :document1, strategy: :cache
    # association :route, factory: :route1, strategy: :cache
    username { "user1" }
    email { "user1@example.com" }
    admin { true }
    password { "averysecurepassword" }
  end
end
