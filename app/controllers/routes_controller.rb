class DocRouteInfoController < ApplicationController

    def show
        @route = Route.find(params[:id])
    end

end