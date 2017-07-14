class Company < ApplicationRecord
    has_many :employees
    has_many :positions
    has_many :company_categories
    has_many :categories, through: :company_categories
    has_many :positions
    has_many :position_shifts, through: :positions

    def events
        collection = []
        company_address = address || "24 south michigan ave chicago IL"
        street_address = company_address.split(' ').join('+')
        distance = "1mi"

        relevant_categories = CompanyCategory.where("relevance != ?", 0)
        relevant_category_string = []

        relevant_categories.each do |rel_cat|
            relevant_category_string << rel_cat.category.api_ref
            @category_string = relevant_category_string.join
            @category_string
        end

        responses = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=#{ street_address }&location.within=#{ distance }&categories=#{ @category_string }&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        responses = responses.first(50)

        responses.each do |event_info|
            event = Event.new(event_info)
            collection << event
        end
        
        collection
    end
end
