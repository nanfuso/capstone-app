class Venue < ApplicationRecord
    has_many :events
    has_many :company_venues

    has_many :companies, through: :company_venues
    
end