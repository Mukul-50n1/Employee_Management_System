class AddForeignKeyToDesignation < ActiveRecord::Migration[6.1]
  def change
    add_column :designations, :employee_id, :integer
  end
end
