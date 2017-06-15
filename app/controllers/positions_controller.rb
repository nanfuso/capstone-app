class PositionsController < ApplicationController

    def index
        @positions = Position.all
    end

    def create
        position = Position.create(
                                    name: params[:name],
                                    company_id: params[:company_id]    
                                 )
        if position.save
            flash[:success] = "Position successfully created"
            redirect_to '/'
        else redirect_to '/positions/new'
            flash[:warning] = "Please submit again"
    end

    def edit
        @position = Position.find(params[:id])
    end

    def update
        @position = Position.find(params[:id])
        @positin.assign_attributes(
                                    name: params[:name],
                                    company_id: params[:company_id]
                                    )
        if @position.save
            flash[:success] = "Position Updated"
        else
            render 'edit.html.erb'
        end
    end

    def destroy
        position = Position.find(params[:id])
        position.destroy
        flash[:danger] = "Position Deleted"
        redirect_to '/'
end
