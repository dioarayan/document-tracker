class RoutesController < ApplicationController
    before_action :require_user

    def index
        @routes = Route.all
    end

    def show
        @route = Route.find(params[:id])
        @document = Document.find(params[:document_id])
        @routes = @document.routes
    end
    
    def new
        @route = Route.new
    end
    
    def create
        @route = Route.new(route_params) 
        @document = Document.find(params[:document_id])
        @route.document_id = @document.id
        debugger
        if @route.save
            redirect_to @route, notice: "You have successfully routed a document!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @route = Route.find(params[:id])
    end

    def update
        @route = Route.find(params[:id])
        if @route.update(route_params)
            redirect_to @route, notice: "You have successfully edit a document!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def route_params
        params.require(:route).permit(:receiving_user_id, :action_id, :remarks)
    end

end