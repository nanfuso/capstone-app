class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :day
      t.string :status

      t.timestamps
    end
  end
end
