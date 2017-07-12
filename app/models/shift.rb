class Shift < ApplicationRecord
    has_many :position_shifts
    has_many :employees, through: :position_shifts
    belongs_to :company

def friendly_employees_needed

        address = company.address || '24 S michigan ave chicago IL'
        street_address = address.split(' ').join('+')
        # distance = CompanyVenue.distance + 'mi' || "1mi"
        distance = '1mi'

        all_events = company.events

        events_during_shift = all_events.select{ |event| shift_date = event.date }
        
        patrons_from_events = 0

        if events_during_shift
            events_during_shift.each do |event|
                patrons_from_events += event.capacity * 0.02
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

    def width
        width = (employees.length.to_f / friendly_employees_needed.to_f) * 100
        width.to_i
    end
end
