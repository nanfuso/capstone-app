class PositionShift < ApplicationRecord
    belongs_to :position
    belongs_to :shift 
    belongs_to :employee
    
end
