class Shift < ApplicationRecord
    has_many :position_shifts
    has_many :events

    belongs_to :position, through :position_shifts
end
