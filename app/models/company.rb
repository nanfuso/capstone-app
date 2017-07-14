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

        relevant_events = Event.where("relevance != ?", 0)
        relevant_category_string = []

        relevant_events.each do |event|
            relevant_category_string << event["category_id"]
            relevant_category_string = relevant_category_string.join("%2C")
        end

        responses = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=#{ street_address }&location.within=#{ distance }&categories=#{ relevant_category_string }&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        responses = responses.first(5)

        responses.each do |event_info|
            event = Event.new(event_info)
            collection << event
        end
        
        collection
    end
end
