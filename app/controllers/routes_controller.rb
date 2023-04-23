class RoutesController < ApplicationController
    before_action :require_user

    def index
        @routes = Route.all
    end

end