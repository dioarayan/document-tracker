class Record < ApplicationRecord
    has_one :document
    belongs_to :status
    belongs_to :user
    accepts_nested_attributes_for :document
    validates :text, length: { maximum: 50 }
end