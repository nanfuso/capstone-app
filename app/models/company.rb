class Company < ApplicationRecord
    has_many :employees
    has_many :positions
    has_many :company_venues

    belongs_to :venue, through :company_venues

end
