class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @_current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            redirect_to login_path, alert: "You must be logged in to perform that action"
        end
    end

    def require_admin
        if !current_user.admin?
            redirect_to login_path, alert: "You must have administrative-level privilage in performing such actions"
        end
    end

end
