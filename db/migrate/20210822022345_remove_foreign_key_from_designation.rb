class RemoveForeignKeyFromDesignation < ActiveRecord::Migration[6.1]
  def change
    remove_column :designations, :employee_id, :integer
  end
end
