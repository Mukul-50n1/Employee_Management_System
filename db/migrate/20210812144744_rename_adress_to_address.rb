class RenameAdressToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_table :adresses, :addresses
  end
end
