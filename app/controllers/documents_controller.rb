class DocumentsController < ApplicationController
    before_action :set_documents, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:destroy]

    def index
        @documents = Document.all
    end

    def show
        @routes = @document.routes
    end

    def new
        @document = Document.new
        respond_to do |format| 
            format.turbo_stream { render turbo_stream: turbo_stream.replace(
                'remote_modal', partial: 'documents/form_modal', locals: {document: @document})}
        end
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
                format.html { render :new, status: :unprocessable_entity, alert: "Error in creating new document" }
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

    def preview
        @document = Document.find(params[:document_id])
        @route = Route.new
        respond_to do |format|
            format.turbo_stream
        end
    end

    private
    
    def set_documents
        @document = Document.find(params[:id])
    end

    def document_params
        params.require(:document).permit(:name, :description, :category_id, :status_id, :section_id)
    end

    def require_same_user
        if current_user != @document.user && !current_user.admin?
            redirect_to @document, alert: "You can only edit or delete your own article"
        end   
    end

end