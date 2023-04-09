class DocRouteInfoController < ApplicationController

    def show
        @route = DocRouteInfo.find(params[:id])
    end

end