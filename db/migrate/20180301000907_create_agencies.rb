class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name, null: false
      t.integer :office_number
      t.integer :fax_number
      t.string :address, null: false
      t.string :email
      t.string :website
      t.string :opening_hours
      t.integer :category, default: 0
      t.text :criteria
      t.text :description

      t.timestamps
    end
  end
end
