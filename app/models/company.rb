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

        responses = @events = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=#{ street_address }&location.within=#{ distance }&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        response = responses.first(20)

        # response.each do |event_info|
        #     event = Event.create(event_info)
        #     collection << event
        # end
        
        # collection
    end
end
