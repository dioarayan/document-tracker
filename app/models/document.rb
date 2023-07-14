class Document < ApplicationRecord
    belongs_to :user
    belongs_to :category
    belongs_to :section
    has_many :routes, dependent: :destroy
    accepts_nested_attributes_for :routes
    validates :name, presence: true, length: { minimum: 6 }
    validates :description, length: { maximum: 100 }
    enum status: {
        Created: 1,
        Pending: 2,
        Processing: 3,
        Completed: 4,
        Lost: 5
    }
end