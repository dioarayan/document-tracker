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
        @routes = Route.where(status_id: Route.statuses[:Forwarded])
    end

    def processing
        @routes = Route.where(status_id: Route.statuses[:Received])
    end

    def completed
        @routes = Route.where(status_id: Route.statuses[:Released])
    end

end