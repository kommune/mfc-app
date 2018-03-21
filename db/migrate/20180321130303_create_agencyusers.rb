class CreateAgencyusers < ActiveRecord::Migration[5.1]
  def change
    create_table :agencyusers do |t|
      t.references :agency, foreign_key: true
      t.string :agency_username, null: false

      t.timestamps
    end
  end
end
