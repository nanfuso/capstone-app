class CreatePositionShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :position_shifts do |t|
      t.integer :position_id
      t.integer :employee_id
      t.integer :shift_id

      t.timestamps
    end
  end
end
