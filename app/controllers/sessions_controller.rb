class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:current_user_id] = user.id
            redirect_to user_path(user.id), notice: "Logged in successfully"
        else
            flash.now[:alert] = "There was something wrong with your login details"
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        session.delete(:current_user_id)
        @_current_user = nil
        redirect_to root_path, status: :see_other, notice: "You are logged out"
    end

        
    

end