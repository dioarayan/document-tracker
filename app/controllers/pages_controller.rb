class PagesController < ApplicationController

    def home
        redirect_to documents_path if logged_in?
    end

    def about
    end

    def dashboard
        @documents = Document.order(id: :desc)
    end

    def pending
        @routes = Route.forwarded.order(id: :desc) 
    end

    def processing
        @routes = Route.received.order(id: :desc)  
    end

    def completed
        @routes = Route.released.order(id: :desc) 
    end

end