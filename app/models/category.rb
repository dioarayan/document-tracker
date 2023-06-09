class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 45 }
    validates_uniqueness_of :name
    has_many :documents
end