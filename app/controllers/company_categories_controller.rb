class CompanyCategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    def index
        @categories = Unirest.get("#{ ENV["API_HOST"] }/categories?token=#{ ENV["OAUTH_TOKEN"] }").body["categories"]
    end

    def new
    end

    def create
        @company_category = CompanyCategory.create(
                                                    company_id: current_employee.company.id,
                                                    category_id: params[:category_id],
                                                    relevance: params[:relevance]
                                                    )
        
        if @company_category.save
            flash[:success] = "Event categories added!"
            redirect_to '/companycategories'
        else redirect_to '/companycategories'
            flash[:warning] = "Please submit again"
        end
    end

end
