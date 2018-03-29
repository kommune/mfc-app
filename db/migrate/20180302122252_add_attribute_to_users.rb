class AddAttributeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :username, :string, null: false
    add_column :users, :postal_code, :integer
    add_column :users, :birth_date, :date, null: false, default: Time.now
    add_column :users, :gender, :integer, default: 0
    add_column :users, :marital_status, :integer, default: 0
    add_column :users, :children, :integer, default: 0
    add_column :users, :role, :integer, default: 0
    add_index :users, :username, unique: true
  end
end
