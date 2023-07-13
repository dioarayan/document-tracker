FactoryBot.define do
  factory :document1, class: Document do
    association :user, factory: :user1, strategy: :cache
    association :category, factory: :category1, strategy: :cache
    association :section, factory: :section1, strategy: :cache

    name { "Document name" }
    description { "This is a document description" }
  end
end
