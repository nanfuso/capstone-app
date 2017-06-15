class ShiftsController < ApplicationController
    def index
            @shifts = Shift.where("status = ?", "need coverage")
    end

    def create
        shift = Shift.create!(
                        day: params[:day],
                        time: params[:time],
                        status: "need coverage",
                        # position_id: params[:position_id]
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
                                day: params[:day],
                                date: params[:date],
                                time: params[:time],
                                position_id: params[:position_id]
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
