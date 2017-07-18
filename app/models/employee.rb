class Employee < ApplicationRecord
    has_secure_password
    belongs_to :company, optional: true
    has_many :position_shifts
    has_many :shifts, through: :position_shifts
    has_many :positions

    validates :email, uniqueness: true
    validates :password, length: {in: 6..20}, on: :create

    def full_name
        first_name.titleize + " " + last_name.titleize
    end

    def employee_shift_data
        shift_data = (position_shifts.length.to_f / PositionShift.all.length.to_f) * 100
        shift_data.to_i
    end

end
