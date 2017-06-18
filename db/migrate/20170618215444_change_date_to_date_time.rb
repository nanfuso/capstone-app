class ChangeDateToDateTime < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :date, :string
  end
end
