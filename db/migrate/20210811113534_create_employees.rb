class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :mobile
      t.string :address
      t.date :dob
      t.date :doj

      t.timestamps
    end
  end
end
