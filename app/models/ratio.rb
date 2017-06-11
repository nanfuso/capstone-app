class Ratio < ApplicationRecord
    belongs_to :primary_position, class_name: "Position", foreign_key: "primary_id"
    belongs_to :dependent_position, class_name: "Position", foreign_key: "dependent_id"
end
