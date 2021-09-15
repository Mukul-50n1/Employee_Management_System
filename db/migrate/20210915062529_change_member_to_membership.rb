class ChangeMemberToMembership < ActiveRecord::Migration[6.1]
  def change
     rename_table :members, :memberships
     
  end
end
