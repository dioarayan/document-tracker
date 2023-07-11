class Route < ApplicationRecord
	belongs_to :document
	belongs_to :destination_user, class_name: "User"
	accepts_nested_attributes_for :document
	validates :remarks, presence: false, length: { maximum: 100}
	class Status
		Forwarded = 1
		Received = 2
		Released = 3
		Declined = 4
	end    

end 
