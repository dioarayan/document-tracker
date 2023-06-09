class Route < ApplicationRecord
    belongs_to :document
    accepts_nested_attributes_for :document
    belongs_to :receiving_user, class_name: "User"
    validates :remarks, presence: false, length: { maximum: 100}
end