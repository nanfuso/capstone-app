class CompanyCategory < ApplicationRecord
    belongs_to :company
    belongs_to :category
    
    enum relevance: [0, 1, 2, 3, 4, 5]
end
