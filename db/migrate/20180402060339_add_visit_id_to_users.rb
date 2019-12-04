class AddVisitIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :visit_id, :bigint
  end
end
