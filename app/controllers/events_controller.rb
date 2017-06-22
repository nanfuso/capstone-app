class EventsController < ApplicationController
    def index
        @events = Unirest.get("#{ ENV["API_HOST"] }/venues/?token=#{ ENV["OAUTH_TOKEN"]}").body
        # @chi_events = @events.venues.where("address = ?", iLIKE "Chicago")
    end

end
