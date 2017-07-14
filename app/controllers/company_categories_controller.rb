class CompanyCategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    def index
        @categories = Category.all
    end

    def new
    end

    def create
        input = params[:relevance]

        input.each do |cat_id, cat_rel|

            @company_category = CompanyCategory.create!(
                                                    company_id: current_employee.company.id,
                                                    category_id: cat_id,
                                                    relevance: cat_rel
                                                    )
        end

        
        if @company_category.save
            flash[:success] = "Event categories added!"
            redirect_to '/'
        else redirect_to '/companycategories'
            flash[:warning] = "Please submit again"
        end
    end

end
