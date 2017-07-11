class CompanyCategoriesController < ApplicationController
    enum relevance: [:yes, :no]

    def index
        @categories = Unirest.get("#{ ENV["API_HOST"] }/categories?token=#{ ENV["OAUTH_TOKEN"] }").body["categories"]
    end

    def new
    end

    def create
        @company_category = CompanyCategory.create!(
                                                    company_id: current_employee.company.id,
                                                    category_id: ,
                                                    relevance: params[:relevance]
                                                    )
    end

end
