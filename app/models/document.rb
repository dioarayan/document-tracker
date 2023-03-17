class Document < ApplicationRecord
    validates :name, presence: true, length: { minimum: 6 }
    validates :description, length: { maximum: 100 }
end