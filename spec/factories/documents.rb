FactoryBot.define do
  factory :document1, class: Document do
    association :category, factory: :category1, strategy: :cache
    association :section, factory: :section1, strategy: :cache
    association :status, factory: :status1, strategy: :cache

    name { "Document name" }
    description { "This is a document description" }
  end
end
