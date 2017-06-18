class Shift < ApplicationRecord
    has_many :events
    has_many :venues, through: :events
    has_many :position_shifts
    has_many :employees, through: :position_shifts
end
