class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :shift_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
