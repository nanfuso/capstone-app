class CompanyCategory < ApplicationRecord
    belongs_to :company
    belongs_to :category

    def width
        width = (relevance.to_f/5).to_f * 100
        width.to_i
    end

    def progress_color
        if width < 100
            color = "info"
        else
            color = "warning"
        end
        color
    end
end
