class ChangeVenueIdToEventId < ActiveRecord::Migration[5.1]
  def change
    rename_column :company_venues, :venue_id, :event_id
  end
end
