class PagesController < ApplicationController

    def home
        redirect_to documents_path if logged_in?
    end

    def about
    end

    def dashboard
        @documents = Document.all
    end

end