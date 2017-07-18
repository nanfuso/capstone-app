class EmployeesController < ApplicationController

    def home

    end

    def new
        @employees = Employee.all.sort_by{ |emp| emp[:first_name]}
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
            flash[:success] = "You're hired!!!"
            redirect_to '/signup'
        else
            flash[:warning] = "Please submit form again"
            redirect_to '/signup'
        end
    end
end
