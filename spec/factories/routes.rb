FactoryBot.define do
    factory :route1, class: Route do
        association :document, factory: :documen1, strategy: :cache
        remarks { "sample remarks" }
        status { Route::Status::Pending }
    end
end
  