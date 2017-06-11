class Position < ApplicationRecord
    belongs_to :company

    has_many :positionshift
    has_many :employees, through :positionshift
    has_many :shifts, through :positionshift
end
