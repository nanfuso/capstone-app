class EmployeesController < ApplicationController
before_action :authenticate_admin!
    def home

    end

    def new
        render 'new.html.erb'
    end

    def create
        employee = Employee.new(
                                    first_name: params[:first_name],
                                    last_name: params[:last_name],
                                    email: params[:email],
                                    password: params[:password],
                                    password_confirmation: params[:password_confirmation],
                                    company_id: params[:company][:company_id],
                                    position_id: params[:position][:position_id]
                                )
        if employee.save
            flash[:success] = "Account created!"
            redirect_to '/'
        else
            redirect_to '/signup'
            flash[:warning] = "Please submit form again"
        end
    end
end
