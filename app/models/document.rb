class Document < ApplicationRecord
    belongs_to :user
    belongs_to :doctype
    has_many :routes
    validates :name, presence: true, length: { minimum: 6 }
    validates :description, length: { maximum: 100 }
end