class AddColumnToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :designation_id, :integer
  end
end
