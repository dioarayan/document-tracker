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
        @routes = Route.forwarded 
    end

    def processing
        @routes = Route.received 
    end

    def completed
        @routes = Route.released
    end

end