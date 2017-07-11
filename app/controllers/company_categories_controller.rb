class CompanyCategoriesController < ApplicationController
    enum relevance: [:yes, :no]

    def index
        @categories = Unirest.get("#{ ENV["API_HOST"] }/categories?token=#{ ENV["OAUTH_TOKEN"] }").body["categories"]
    end

    def new
    end

    def create
        
    end

end
