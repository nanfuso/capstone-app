class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :company_id
      t.string :role

      t.timestamps
    end
  end
end
