class Route < ApplicationRecord
    belongs_to :document
    belongs_to :status
    belongs_to :receiving_user, class_name: "User"
    validates :remarks, presence: false, length: { maximum: 100}
end