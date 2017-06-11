class CreateCompanyVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :company_venues do |t|
      t.integer :company_id
      t.integer :venue_id
      t.string :relevance

      t.timestamps
    end
  end
end
