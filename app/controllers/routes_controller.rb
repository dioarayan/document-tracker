class RoutesController < ApplicationController
    before_action :require_user
    before_action :set_document, only: [:new, :create, :show]

    def index
        @routes = Route.all
    end

    def show
        @route = Route.find(params[:id])
        @routes = @document.routes
    end
    
    def new
        @route = Route.new
    end
    
    def create
        @route = Route.new(route_params)
        respond_to do |format|  
            if @route.save
                format.html{ redirect_to @document, notice: "You have successfully routed a document" }
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
        if @route.update(route_params)
            redirect_to @route, notice: "You have successfully edit a document!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @route.destroy
        redirect_to routes_path, status: :see_other, notice: "You have successfully deleted a route!"
    end

    private

    def route_params
        params.require(:route).permit(:document_id, :receiving_user_id, :remarks, :status_id, :accept)
    end

    def set_document
        @document = Document.find(params[:document_id])
    end

end