class ShiftsController < ApplicationController
    def index
        if current_employee
            @shifts = Shift.find_by(where employee_id: current_employee.id)
        else
            flash[:warning] = "Please sign in to see current schedule" 
            redirect_to '/login'
        end
    end

    def create
        shift = Shift.new(
                        day: params[:day],
                        time: params[:time],
                        status: "available",
                        employee_id: current_employee.id
                            )
        shift.save
        flash[:success] = "Schedule created"
        redirect_to '/'
    end

end
