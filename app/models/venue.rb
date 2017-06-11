class Venue < ApplicationRecord
    has_many :events
    has_many :company_venues

    belongs_to :company, through :company_venues
    
end
