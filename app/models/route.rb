class Route < ApplicationRecord
    belongs_to :document
    belongs_to :status
    belongs_to :user
    validates :remarks, presence: false, length: {minimum: 3, maximum: 100}
end