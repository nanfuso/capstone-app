class Shift < ApplicationRecord
    has_many :events
    has_many :venues, through: :events
    has_many :position_shifts
    has_many :employees, through: :position_shifts

    def friendly_employees_needed

        all_events = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=Chicago&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        events_during_shift = all_events.select{ |event| shift_date >= event["start"]["local"].to_date && shift_date <= event["end"]["local"].to_date}
        
        patrons_from_events = 0

        if events_during_shift
            events_during_shift.each do |event|
                patrons_from_events += event["capacity"] * 0.02
            end
        end
        
        capacity = patrons_from_events + 30
        max_employees_on_floor = 15
        if capacity > 500
            employees_needed = max_employees_on_floor
        elsif capacity < 100
            employees_needed = capacity * 0.08
            employees_needed.ceil
        elsif
            employees_needed = 8 + ((capacity - 100)/75)
            employees_needed.ceil
        end
    end

end
