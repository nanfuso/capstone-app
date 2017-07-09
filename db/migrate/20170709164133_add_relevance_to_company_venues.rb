class AddRelevanceToCompanyVenues < ActiveRecord::Migration[5.1]
  def change
    add_column :company_venues, :relevance, :integer
  end
end
