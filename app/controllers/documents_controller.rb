class DocumentsController < ApplicationController
   
    def index
        @document = Document.all
    end

    def show
        @document = Document.find(params[:id])
    end

    def new
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)
        @document.user = User.first
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
    
    def document_params
        params.require(:document).permit(:name, :description)
    end

end