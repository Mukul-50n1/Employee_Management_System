class RemoveColumnFromEmployer < ActiveRecord::Migration[6.1]
  def change
    remove_column :employers, :encrypted_password, :string
    remove_column :employers, :reset_password_token, :string
    remove_column :employers, :reset_password_sent_at, :string
    remove_column :employers, :remember_created_at, :string
  end
end
