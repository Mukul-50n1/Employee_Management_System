class AddColumnToEmployer < ActiveRecord::Migration[6.1]
  def change
    add_reference :employers, :user, foreign_key: true
  end
end
