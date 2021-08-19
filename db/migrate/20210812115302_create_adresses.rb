class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.string :type
      t.string :country
      t.string :state
      t.string :city
      t.string :street_address
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
