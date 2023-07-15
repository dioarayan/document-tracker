class DocumentForwardingException < StandardError
  def forward_error_message
    "Failed to forward document."
  end

  def decline_error_message
    "Failed to decline document."
  end
end
