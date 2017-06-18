class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id]) if session[:employee_id]
  end
helper_method :current_employee

def admin_signed_in?
    current_employee && current_employee.admin 
  end
  helper_method :admin_signed_in?

private

    def authenticate_user!
        redirect_to '/login' unless current_employee
    end
end

    def authenticate_admin!
       redirect_to '/login' unless (current_employee && current_employee.admin)
    end


