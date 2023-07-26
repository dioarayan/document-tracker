class RoutesController < ApplicationController
    before_action :require_user
    before_action :set_document, only: [:new, :create, :show, :edit]

    def index
        @routes = Route.all
    end

    def show
        @route = Route.new
        @found_route = Route.find(params[:id])
        @routes = @document.routes
    end
    
    def new
        @route = Route.new
    end
    
    def create
        @route = Route.new(route_params)
        debugger
        respond_to do |format|  
            if @route.save
                format.html{ redirect_to documents_path, notice: "You have successfully routed a document" }
            else
                format.turbo_stream { render turbo_stream: turbo_stream.replace(
                'remote_modal', partial: 'routes/form_modal', locals: {route: @route})}
                format.html { render :new, status: :unprocessable_entity, alert: "Error in routing a document" }
            end
        end
    end

    def edit
        @route = Route.find(params[:id])
    end

    def update
        @route = Route.find(params[:id])
        #if params[:state].present?
        #    @route.update(state: params[:state])
        #end
        #redirect_to @route, notice: "You successfully accepted a document!"
        if @route.update(route_params)
            redirect_to processing_path, notice: "You just accepted a document!"
        else
            redirect_to request.path, status: :unprocessable_entity, notice: "Error accepting document!"
        end
    end

    def destroy
        @route = Route.find(params[:id])
        if @route.destroy
            redirect_to pending_path, notice: "You have successfully rejected a document!"
        else
            redirect_to request.path, status: :unprocessable_entity, notice: "Error rejecting document!"
        end
    end

    private

    def route_params
        params.require(:route).permit(:document_id, :destination_user_id, :remarks, :state)
    end

    def set_document
        @document = Document.find(params[:document_id])
    end

end