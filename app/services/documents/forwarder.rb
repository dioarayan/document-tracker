class Documents::Forwarder
  include Serviceable

  def initialize(destination:)
    @destination = destination
  end

  def call
    foward_document
  end

  private

  attr_reader :destination

  def foward_document
    return new_route if new_route.errors.blank?

    raise DocumentForwardingException
  end

  def new_route
    @new_route ||= Route.create(destination) 
  end
end
