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
        @patrons_from_events = 0

        if CompanyCategory.all.length > 0
            @events_with_1_relevance = all_events.select{ |event| shift_date = event.date && event.relevance(company) == 1}
            @events_with_2_relevance = all_events.select{ |event| shift_date = event.date && event.relevance(company) == 2}
            @events_with_3_relevance = all_events.select{ |event| shift_date = event.date && event.relevance(company) == 3}
            @events_with_4_relevance = all_events.select{ |event| shift_date = event.date && event.relevance(company) == 4}
            @events_with_5_relevance = all_events.select{ |event| shift_date = event.date && event.relevance(company) == 5}
                
                @patrons_from_events = 0

                @events_with_1_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.02
                end
                
                @events_with_2_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.03
                end

                @events_with_3_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.04
                end

                @events_with_4_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.05
                end

                @events_with_5_relevance.each do |event|
                    @patrons_from_events += event.capacity * 0.06
                end
        else
            @events_during_shift = all_events.select{ |event| shift_date = event.date }

            @patrons_from_events = 0

            if events_during_shift
                events_during_shift.each do |event|
                    @patrons_from_events += event.capacity * 0.10
                end
            end
        end

        @capacity = @patrons_from_events * 0.5
        max_employees_on_floor = 27

        if @capacity >=  200
            @managers_needed = 3
            @servers_needed = 12
            @bartenders_needed = 2
            @hoh_needed = 6
            @hosts_needed = 4
            @employees_needed = max_employees_on_floor
        else @capacity < 200 
            @managers_needed = 2
            @servers_needed = @capacity * 0.06
                @servers_needed.ceil.to_i
            @bartenders_needed = 2
            @hoh_needed = @capacity * 0.03
                @hoh_needed.ceil.to_i
            @hosts_needed = @capacity * 0.02
                @hosts_needed.ceil.to_i
            @employees_needed = @managers_needed + @servers_needed + @bartenders_needed + @hoh_needed + @hosts_needed
            @employees_needed.to_i
        end
           

    end

    def servers_needed
        @servers_needed.to_i
    end

    def bartenders_needed
        @bartenders_needed.to_i
    end

    def hoh_needed
        @hoh_needed.to_i
    end

    def hosts_needed
        @hosts_needed.to_i
    end

    def managers_needed
        @managers_needed.to_i
    end

    def width
        width = (employees.length.to_f / friendly_employees_needed.to_f) * 100
        width.to_i
    end
end
