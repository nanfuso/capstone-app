class Event < ApplicationRecord
    belongs_to :shift
    belongs_to :venue
end
