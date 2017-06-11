class Employee < ApplicationRecord
    has_secure_password
    belongs_to :company, optional: true
    has_many :position_shifts
    has_many :shifts, through: :position_shifts
    has_many :postiions, through: :position_shifts

    validates :email, uniqueness: true
    validates :password, length: {in: 6..20}
end
