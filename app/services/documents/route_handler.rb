class Documents::RouteHandler
  include Serviceable

  def initialize(destination:)
    @destination = destination
  end

  def call
    handle_document_route
  end

  private

  attr_reader :destination

  def handle_document_route
    return new_route if new_route.errors.blank?

    raise DocumentForwardingException
  end

  def new_route
    @new_route ||= Route.create(destination) 
  end
end
