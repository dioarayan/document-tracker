class Document < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { minimum: 6 }
    validates :description, length: { maximum: 100 }
end