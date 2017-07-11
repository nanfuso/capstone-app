class CreateCompanyCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :company_categories do |t|
      t.integer :relevance
      t.integer :company_id
      t.integer :category_id

      t.timestamps
    end
  end
end
