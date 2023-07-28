class Route < ApplicationRecord
	belongs_to :document
	belongs_to :destination_user, class_name: "User"
	validates :remarks, presence: false, length: { maximum: 100}
	enum :state, {
		forwarded: 0,
		received: 1,
		released: 2,
		declined: 3
	}   

	after_create :set_document_to_pending
	after_update :set_document_to_processing

	def set_document_to_pending
		document.update(status: :pending)
	end

	def set_document_to_processing
		document.update(status: :processing)
	end

end 

