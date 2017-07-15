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

        if CompanyCategory.all.length > 0
            @events_with_1_relevance = all_events.select{ |event| shift_date = event.date && event.category.relevance == 1}
            @events_with_2_relevance = all_events.select{ |event| shift_date = event.date && event.category.relevance == 2}
            @events_with_3_relevance = all_events.select{ |event| shift_date = event.date && event.category.relevance == 3}
            @events_with_4_relevance = all_events.select{ |event| shift_date = event.date && event.category.relevance == 4}
            @events_with_5_relevance = all_events.select{ |event| shift_date = event.date && event.category.relevance == 5}
                
                @patrons_from_events = 0

                @events_with_1_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.05
                end
                
                @events_with_2_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.08
                end

                @events_with_3_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.12
                end

                @events_with_4_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.15
                end

                @events_with_5_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.20
                end
        else
            @events_during_shift = all_events.select{ |event| shift_date = event.date }

            @patrons_from_events = 0

            if events_during_shift
                events_during_shift.each do |event|
                    @patrons_from_events += event.capacity * 0.02
                end
            end
        end

        capacity = @patrons_from_events + 50
        max_employees_on_floor = 26
        if capacity > 500
            employees_needed = max_employees_on_floor
            @managers_needed = 2
            @servers_needed = 12
            @bartenders_needed = 2
            @hoh_needed = 6
            @hosts_needed = 4
        else capacity < 100
            @managers_needed = 1
            @servers_needed = capacity * 0.08
                @servers_needed.ceil
            @bartenders_needed = 1
            @hoh_needed = capacity * 0.04
                @hoh_needed.ceil
            @hosts_needed = capacity * 0.02
                @hosts_needed.ceil
            employees_needed = @managers_needed + @servers_needed + @bartenders_needed + @hoh_needed + @hosts_needed
        end
    end

    def servers_needed
        @servers_needed
    end

    def bartenders_needed
        @bartenders_needed
    end

    def hoh_needed
        @hoh_needed
    end

    def hosts_needed
        @hosts_needed
    end

    def managers_needed
        @managers_needed
    end

    def width
        width = (employees.length.to_f / friendly_employees_needed.to_f) * 100
        width.to_i
    end
end
