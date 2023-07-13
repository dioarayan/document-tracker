class DocumentForwardingException < StandardError
  def message
    "Failed to forward document."
  end
end
