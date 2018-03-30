class AddVisitIdToAgencies < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :visit_id, :bigint
  end
end
