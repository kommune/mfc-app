class CreateAgenciesCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies_categories do |t|
      t.references :category, foreign_key: true
      t.references :agency, foreign_key: true

      t.timestamps
    end
    add_index :agencies_categories, [:agency_id, :category_id], unique: true
  end
end
