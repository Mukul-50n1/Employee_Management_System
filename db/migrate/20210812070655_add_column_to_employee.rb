class AddColumnToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees    ,:first_name ,:string
    add_column :employees     ,:last_name  ,:string
    remove_column :employees  ,:name       ,:string
  end
end
