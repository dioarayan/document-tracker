FactoryBot.define do
    factory :route1, class: Route do
        association :document, factory: :document1, strategy: :cache
        association :destination_user, factory: :user1, strategy: :cache
        remarks { "sample remarks" }
    end
end
  