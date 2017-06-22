class Event < ApplicationRecord
    belongs_to :shift
    belongs_to :venue

    # attr_accessor :id, :title, :location, :date

    # def initialize(hash_options)
    #     @id = hash_options["id"]
    #     @title = hash_options["title"]
    #     @location = hash_options["location"]
    #     @date = hash_options["date"]
    # end

    # def self.find(id)
    #     Event.new(Unirest.get('http://api.eventful.com/rest/').body)
    # end

    # def self.all
    #     event_hashes = Unirest.get('http://api.eventful.com/rest/').body
    #     events = []
    #     event_hases.each do |event_hash|
    #         events << Event.new(event_hash)
    #     end
    #     events

end
