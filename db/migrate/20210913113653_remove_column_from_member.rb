class RemoveColumnFromMember < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :user_id, :string
    remove_column :members, :role_id, :string
  end
end
