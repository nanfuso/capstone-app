class Event
    attr_accessor :name, :category_id, :date

    def initialize(options)
        @name = options["name"]
        @category = Category.find_or_create_by(options["category_id"])

        unless @category.name
            category_response = Unirest.get("#{ ENV["API_HOST"] }/categories/#{ category_id }?token=#{ ENV["OAUTH_TOKEN"] }").body["name"]
            @category.update(name: category_response)
        end
        @date = options["date"]
    end

    def relevance(company)
        company.company_categories.where(category_id: category_id).first.relevance
    end
end