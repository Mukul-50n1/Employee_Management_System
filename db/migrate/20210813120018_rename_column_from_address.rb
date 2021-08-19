class RenameColumnFromAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses ,:type ,:address_types
  end
end
