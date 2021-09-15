class AddColumnToMember < ActiveRecord::Migration[6.1]
  def change
    add_reference :members, :employer,  foreign_key: true
  end
end
