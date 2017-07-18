class ShiftsController < ApplicationController
    before_action :authenticate_admin!

    def index
        @shifts = Shift.where("shift_date >= ?", DateTime.now).sort_by{ |shift| shift[:shift_date]}
        
    end

    def show
        @shift = Shift.find(params[:id])
    end

    def create
        shift = Shift.create!(
                        time: params[:time],
                        shift_date: params[:shift_date],
                        status: "need coverage",
                        company_id: current_employee.company.id
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
                                shift_date: params[:shift_date],
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
        position_shifts = PositionShift.where(shift_id: params[:id])
        position_shifts.destroy_all
        shift.destroy
        flash[:danger] = "Shift posting deleted"
        redirect_to '/shifts'
    end
end
