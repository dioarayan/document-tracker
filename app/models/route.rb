class Route < ApplicationRecord
    belongs_to :document
    accepts_nested_attributes_for :document
    belongs_to :receiving_user, class_name: "User"
    validates :remarks, presence: false, length: { maximum: 100}
    class Status
        Pending = 1
        Forwarded = 2
        Accepted = 3
    end    
end