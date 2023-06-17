FactoryBot.define do
  factory :section1, class: Section do
    association :division, factory: :division1, strategy: :cache

    name { "Section name" }
  end
end
