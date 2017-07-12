class CompanyCategory < ApplicationRecord
    belongs_to :company
    belongs_to :category
    
    enum relevance: [:yes, :no]
end
