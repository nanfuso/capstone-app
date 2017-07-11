class CompanyCategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    def index
        @categories = Category.all
    end

    def new
    end

    def create
        
        @company_category = CompanyCategory.create!(
                                                    company_id: current_employee.company.id,
                                                    category_id: params[:category_id],
                                                    relevance: params[:relevance]
                                                    )
    end

end
