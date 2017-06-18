class AddCalendarDateToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :shift_date, :date
  end
end
