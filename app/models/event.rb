class Event
    attr_accessor :name, :category, :date, :capacity

    def initialize(options)
        @name = options["name"]["text"]
        @category = Category.find_or_create_by(api_ref: options["category_id"].to_i)

        unless @category.name
            category_response = Unirest.get("#{ ENV["API_HOST"] }/categories/#{ @category.api_ref }?token=#{ ENV["OAUTH_TOKEN"] }").body["name"]
            @category.update(name: category_response)
        end
        @date = options["start"]["local"]
        @capacity = options["capacity"]
    end

    def relevance(company)
        company.company_categories.where(category_id: category.id).first.relevance
    end

end