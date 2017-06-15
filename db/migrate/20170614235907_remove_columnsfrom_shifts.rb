class RemoveColumnsfromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :employee_id, :integer
    remove_column :shifts, :company_id, :integer
  end
end
