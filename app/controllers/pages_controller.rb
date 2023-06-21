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
        @routes = Route.where(status_id: Route::Status::Pending)
    end

    def processing
        @routes = Route.where(status_id: Route::Status::Accepted)
    end

    def completed
        @routes = Route.where(status_id: Route::Status::Completed)
    end

end