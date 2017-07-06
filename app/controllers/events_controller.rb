class EventsController < ApplicationController
    def index
        address = params["street_address"] || "24 south michigan ave chicago IL"
        street_address = address.split(' ').join('+')
        distance = params["distance"] || "1mi"

        @events = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=#{ street_address }&location.within=#{ distance }&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        

        # @categories = Unirest.get("#{ ENV["API_HOST"] }/categories/?token=#{ ENV["OAUTH_TOKEN"] }").body["categories"]["capacity"]
    end
end
