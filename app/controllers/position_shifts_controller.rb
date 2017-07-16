class PositionShiftsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!, except: :index

    def index
        @position_shifts = PositionShift.all
        @employees_position_shifts = PositionShift.where(employee_id: current_employee.id ).sort_by{ |shift| shift[:shift_date]} 
        @shifts = Shift.where("shift_date >= ?", DateTime.now)
        @shifts = @shifts.sort_by{ |shift| shift[:shift_date]}
    end

    def create
        @position_shift = PositionShift.create!(
                                        employee_id: params[:employee][:employee_id],
                                        shift_id: params[:shift][:shift_id],
                                        position_id: params[:position][:position_id]
                                            )
        if @position_shift.save
            flash[:success] = "Employee Added to shift!"
            redirect_to '/'
        else 
            flash[:warning] = "Please submit again"
            redirect_to '/'
        end



    end

    def edit
        @position_shift = PositionShift.find(params[:id])
    end

    def update
        @position_shift = PositionShift.find(params[:id])
        @position_shift.assign_attributes(
                                        employee_id: params[:employee][:employee_id],
                                        
                                        position_id: params[:position][:position_id]
                                        )
        if @position_shift.save
            flash[:success] = "Shift Updated"
            redirect_to '/'
        else
            render 'edit.html.erb'
        end
    end

    def destroy
        position_shift = PositionShift.find(params[:id])
        position_shift.destroy
        flash[:danger] = "Shift no longer covered"
        redirect_to '/'
    end

end