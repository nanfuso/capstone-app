class EventsController < ApplicationController
    def index
        @events = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=Chicago&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        
        city = params["address"] || "chicago"

        @categories = Unirest.get("#{ ENV["API_HOST"] }/categories/?token=#{ ENV["OAUTH_TOKEN"] }").body["categories"]["capacity"]
    end
end
