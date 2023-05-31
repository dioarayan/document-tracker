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
        respond_to do |format|  
            if @document.save
                format.html{ redirect_to @document, notice: "You have successfully created a new document" }
            else
                format.turbo_stream { render turbo_stream: turbo_stream.replace(
                'remote_modal', partial: 'documents/form_modal', locals: {document: @document})}
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        debugger
        respond_to do |format|
            if @document.update(document_params)
                format.html { redirect_to @document, notice: "You have successfully edit a document!" }
            else
                format.turbo_stream { render turbo_stream: turbo_stream.replace(
                'remote_modal', partial: 'documents/form_modal', locals: {document: @document})}
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @document.destroy
        redirect_to documents_path, status: :see_other, notice: "You have successfully deleted a document!"
    end

    def pending
        @documents = Document.where(status: 1)
    end

    def processing
        @documents = Document.where(status: 2)
    end

    def completed
        @documents = Document.where(status: 3)
    end

    def to_route?
        
    end

    private
    
    def set_documents
        @document = Document.find(params[:id])
    end

    def document_params
        params.require(:document).permit(:name, :description, :category_id, :status_id, routes_attributes: [:receiving_user_id, :remarks])
    end

    def require_same_user
        if current_user != @document.user && !current_user.admin?
            redirect_to @document, alert: "You can only edit or delete your own article"
        end   
    end

end