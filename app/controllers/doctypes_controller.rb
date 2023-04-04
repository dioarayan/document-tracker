class DoctypesController < ApplicationController

    def index
        @doctypes = Doctype.all
    end

    def show
        @doctype = Doctype.find(params[:id]) 
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
        @doctype = Doctype.find(params[:id])
    end

    def update
        @doctype = Doctype.find(params[:id])
        if @doctype.update(params.require(:doctype).permit(:name))
            redirect_to @doctype, notice: "You have successfully edit a doc type!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @doctype = Doctype.find(params[:id])
        @doctype.destroy
        redirect_to doctypes_path, status: :see_other, notice: "You have successfully deleted a doc type!"
    end


end