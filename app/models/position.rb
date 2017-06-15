class Position < ApplicationRecord
    belongs_to :company

    has_many :position_shifts, through: :position_shifts
    has_many :employees
    # has_many :shifts, through: :position_shifts

    has_many :primary_ratios, class_name: "Ratio", foreign_key: "primary_id"
    has_many :dependent_postions, through: :primary_ratios
    has_many :dependent_raitos, class_name: "Ratio", foreign_key: "dependant_id"
    has_many :primary_postions, through: :primary_ratios


end
