class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, except: [:index, :show]

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @documents = @category.documents
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(params.require(:category).permit(:name))
        if @category.save
            redirect_to categories_path, notice: "You have successfully created a new category!"
        else
            render :new, status: :unprocessable_entity
        end   
    end

    def edit
        
    end

    def update
        if @category.update(params.require(:category).permit(:name))
            redirect_to @category, notice: "You have successfully edit a category!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path, status: :see_other, notice: "You have successfully deleted a category!"
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end


end