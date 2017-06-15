class Employee < ApplicationRecord
    has_secure_password
    belongs_to :company, optional: true
    has_many :position_shifts
    has_many :shifts, through: :position_shifts
    has_many :positions

    validates :email, uniqueness: true
    validates :password, length: {in: 6..20}, on: :create
end
