class CompanyVenue < ApplicationRecord
    belongs_to :venue
    belongs_to :company
    
end
