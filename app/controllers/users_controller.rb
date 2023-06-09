class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    #before_action :require_user, except: [:new, :create]
    before_action :require_same_user, only: [ :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show

    end

    def new
        @user = User.new
        @user.sections_id
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:current_user_id] = @user.id
            redirect_to @user, notice: "Welcome to Document Tracker, #{@user.username}! You have successfully signed in."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: "You have successfully edited a user!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        session[:current_user_id] = nil if @user == current_user 
        flash[:notice] = "Account and all associated articles successfully deleted"
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            redirect_to user_path(current_user), alert: "You can only edit or delete your own profile"
        end   
    end

end