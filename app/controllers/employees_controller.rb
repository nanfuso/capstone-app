class EmployeesController < ApplicationController

    def home

    end

    def new
        @employees = Employee.all
        render 'new.html.erb'
    end

    def create
        employee = Employee.new(
                                    first_name: params[:first_name],
                                    last_name: params[:last_name],
                                    email: params[:email],
                                    password: params[:password],
                                    password_confirmation: params[:password_confirmation],
                                    company_id: params[:company][:company_id]
                                )
        if employee.save
            flash[:success] = "You're here!!!"
            redirect_to '/'
        else
            flash[:warning] = "Please submit form again"
            redirect_to '/signup'
        end
    end
end
