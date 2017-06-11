class CreateRatios < ActiveRecord::Migration[5.1]
  def change
    create_table :ratios do |t|
      t.integer :primary_id
      t.integer :primary_count
      t.integer :dependent_id
      t.integer :dependent_count

      t.timestamps
    end
  end
end
