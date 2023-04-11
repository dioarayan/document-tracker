class RecordsController < ApplicationController

    def index
        @records = Record.all
        @record = 
    end

    def show
        @fetchedRecord = Record.find(params[:id])
        @document = @fetchedRecord.document
        @records = @document.records
    end

    def new 
        @record = Record.new
        @record.document
    end

    def create
        @record = Record.new(record_params)
        @record.user = current_user
        if @record.save
            redirect_to @record, notice: "You have successfully created a new document!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private


    def record_params
        params.require(:record).permit(:status_id, document_attributes: [:name, :description, :doctype_id] )
    end

end