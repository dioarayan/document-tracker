class DoctypesController < ApplicationController
    before_action :set_doctype, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, except: [:index, :show]

    def index
        @doctypes = Doctype.all
    end

    def show
        @documents = @doctype.documents
    end

    def new
        @doctype = Doctype.new
    end

    def create
        @doctype = Doctype.new(params.require(:doctype).permit(:name))
        if @doctype.save
            redirect_to doctypes_path, notice: "You have successfully created a new doc type!"
        else
            render :new, status: :unprocessable_entity
        end   
    end

    def edit
        
    end

    def update
        if @doctype.update(params.require(:doctype).permit(:name))
            redirect_to @doctype, notice: "You have successfully edit a doc type!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @doctype.destroy
        redirect_to doctypes_path, status: :see_other, notice: "You have successfully deleted a doc type!"
    end

    private

    def set_doctype
        @doctype = Doctype.find(params[:id])
    end


end