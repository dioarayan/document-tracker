class DocumentsController < ApplicationController
    before_action :set_documents, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:destroy]

    def index
        @documents = Document.all
    end

    def show
        @document = Document.find(params[:id])
        @routes = @document.routes
        @route = Route.new
    end

    def new
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)
        @document.user = current_user   
        if @document.save
            redirect_to @document, notice: "You have successfully created a new document!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @document = Document.find(params[:id])
    end

    def update
        @document = Document.find(params[:id])
        if @document.update(document_params)
            redirect_to @document, notice: "You have successfully edit a document!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @document = Document.find(params[:id])
        @document.destroy
        redirect_to documents_path, status: :see_other, notice: "You have successfully deleted a document!"
    end

    private
    
    def set_documents
        @document = Document.find(params[:id])
    end

    def document_params
        params.require(:document).permit(:name, :description, :category_id, routes_attributes: [:receiving_user_id])
    end

    def require_same_user
        if current_user != @document.user && !current_user.admin?
            redirect_to @document, alert: "You can only edit or delete your own article"
        end   
    end

end