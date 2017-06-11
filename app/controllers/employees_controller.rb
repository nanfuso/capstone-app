class EmployeesController < ApplicationController
    
    def index
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
                                    password_confirmation: params[:password_confirmation]
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
