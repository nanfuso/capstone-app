class AddApiRefToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :api_ref, :integer
  end
end
