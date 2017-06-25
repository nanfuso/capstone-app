class PositionShift < ApplicationRecord
    belongs_to :position, optional: true
    belongs_to :shift 
    belongs_to :employee
    
    def friendly_employees_needed

        all_events = Unirest.get("#{ ENV["API_HOST"] }/events/search/?location.address=Chicago&token=#{ ENV["OAUTH_TOKEN"] }").body["events"]
        events_during_shift = all_events.select{ |event| shift.shift_date >= event["start"]["local"].to_date && shift.shift_date <= event["end"]["local"].to_date}
        
        patrons_from_events = 0

        if events_during_shift
            events_during_shift.each do |event|
                patrons_from_events += event["capacity"] * 0.03
            end
        end
        
        capacity = patrons_from_events + 50
        max_employees_on_floor = 15
        if capacity > 300
            employees_needed = max_employees_on_floor
        elsif capacity < 100
            employees_needed = capacity * 0.08
            employees_needed.to_f
        elsif
            employees_needed = (capacity - 100)/50
            employees_needed.to_f
        end
        employees_needed
    end
    
end
