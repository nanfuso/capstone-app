class RemoveDayFromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :day, :string
  end
end
