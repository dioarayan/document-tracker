class Section < ApplicationRecord
    has_many :documents
    belongs_to :division
end