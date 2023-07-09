class Route < ApplicationRecord
	belongs_to :document
	belongs_to :destination_user, class_name: "User"
	accepts_nested_attributes_for :document
	validates :remarks, presence: false, length: { maximum: 100}
	class Status
		Pending = 1
		Forwarded = 2
		Accepted = 3
		Completed = 4
	end    

end