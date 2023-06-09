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
        @document = @route.find(params[:document_id])
    end
    
    def create
        @route = Route.new(route_params) 
        @route.receiving_user = current_user 
        debugger   
        if @route.save
            redirect_to processing_documents_path, notice: "You have successfully routed a document!"
        else
            render :documents/edit, status: :unprocessable_entity
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
        params.require(:route).permit(:document_id, document_attributes: [:status_id])
    end

end