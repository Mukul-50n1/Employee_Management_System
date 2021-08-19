class RemoveColumnFromEmployee < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :address, :string
  end
end
