class PositionShift < ApplicationRecord
    belongs_to :position, optional: true
    belongs_to :shift 
    belongs_to :employee
    
    
end
