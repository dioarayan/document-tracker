class PagesController < ApplicationController

    def home
        redirect_to documents_path if logged_in?
    end

    def about
    end

    def dashboard
        @documents = Document.all
    end

    def pending
        @routes = Route.where(status_id: Route::Status::Forwarded)
    end

    def processing
        @routes = Route.where(status_id: Route::Status::Received)
    end

    def completed
        @routes = Route.where(status_id: Route::Status::Released)
    end

end