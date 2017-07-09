class MakeChangesToCompanyVenues < ActiveRecord::Migration[5.1]
  def change
    remove_column :company_venues, :relevance, :string
    add_column :company_venues, :distance, :integer
  end
end
