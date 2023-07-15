class Route < ApplicationRecord
	belongs_to :document
	belongs_to :destination_user, class_name: "User"
	validates :remarks, presence: false, length: { maximum: 100}
	enum status: {
		Forwarded: 1,
		Received: 2,
		Released: 3,
		Declined: 4
	}   

	after_create :set_document_to_pending
	after_update :set_document_to_processing

	def set_document_to_pending
		document.update(status_id: Document.statuses[:Pending])
	end

	def set_document_to_processing
		document.update(status_id: Document.statuses[:Processing])
	end

end 

