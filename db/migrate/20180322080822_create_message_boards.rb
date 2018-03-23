class CreateMessageBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :message_boards do |t|
      t.references :user, foreign_key: true
      t.references :agencyuser, foreign_key: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
