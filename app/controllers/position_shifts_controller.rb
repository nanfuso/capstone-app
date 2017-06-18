class PositionShiftsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @position_shifts = PositionShift.all
        # @shifts = Shift.where("shift_id = ?", params[:shift_id])
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
        else redirect_to '/'
            flash[:warning] = "Please submit again"
        end
    end

    def edit
        @position_shift = PositionShift.find(params[:id])
    end

    def update
        @position_shift = PositionShift.find(params[:id])
        @position_shift.assign_attributes(
                                        employee_id: params[:employee][:employee_id],
                                        shift_id: params[:shift][:shift_id],
                                        position_id: params[:position][:position_id]
                                        )
        if @position_shift.save
            flash[:success] = "Shift Updated"
            redirect_to '/'
        else
            render 'edit.html.erb'
        end
    end

    def delete
        position_shift = PositionShift.find(params[:id])
        position_shift.destroy
        flash[:danger] = "Shift no longer covered"
        redirect_to '/'
    end

end