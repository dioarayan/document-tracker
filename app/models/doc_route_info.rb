class DocRouteInfo < ApplicationRecord
    belongs_to :document
    belongs_to :status
    belongs_to :user
end