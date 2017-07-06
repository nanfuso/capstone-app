class VenuesController < ApplicationController
    def index
        @venues = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=24+south+michigan+ave%2C+chicago+IL&location.within=1mi&token=#{ ENV["OAUTH_TOKEN"] }").body
    end
end
