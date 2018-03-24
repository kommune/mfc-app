class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :feedback
      t.integer :status

      t.timestamps
    end
  end
end
