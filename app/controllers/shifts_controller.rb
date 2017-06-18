class ShiftsController < ApplicationController
    before_action :authenticate_admin!
    def index
            @shifts = Shift.where("status = ?", "need coverage")
    end

    def create
        shift = Shift.create!(
                        time: params[:time],
                        date: params[:date],
                        status: "need coverage"
                            )
        # shift.save
       flash[:success] = "Schedule created"
        redirect_to '/shifts'
        
    end

    def edit
        @shift = Shift.find(params[:id])
    end

    def update
        @shift = Shift.find(params[:id])
        @shift.assign_attributes(
                                date: params[:date],
                                time: params[:time]
                                
            )
        if @shift.save
            flash[:success] = "Posting Updated"
        else
            render 'edit.html.erb'
        end
    end

    def destroy
        shift = Shift.find(params[:id])
        shift.destroy
        flash[:danger] = "Posting Destroyed"
        redirect_to '/'
    end
end
