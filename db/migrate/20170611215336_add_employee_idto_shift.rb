class AddEmployeeIdtoShift < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :employee_id, :integer
  end
end
