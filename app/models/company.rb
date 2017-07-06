class Company < ApplicationRecord
    has_many :employees
    has_many :positions
    has_many :company_venues
    has_many :positions

    has_many :events, through: :company_venues
    has_many :position_shifts, through: :positions


end
