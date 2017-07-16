class CompanyCategory < ApplicationRecord
    belongs_to :company
    belongs_to :category

    def width
        width = (relevance.to_f/5).to_f * 100
        width.to_i
    end

    def progress_color
        if width <= 40
            color = "inverse"
        elsif width > 40 && width <= 80
            color = "warning"
        elsif width > 80
            color = "danger"
        end
        color
    end
end
