class Document < ApplicationRecord
    belongs_to :user
    belongs_to :category
    belongs_to :status
    has_many :routes, dependent: :destroy
    accepts_nested_attributes_for :routes
    validates :name, presence: true, length: { minimum: 6 }
    validates :description, length: { maximum: 100 }
end