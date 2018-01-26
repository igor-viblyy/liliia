class AddToEventCompanyId < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :company_id, :integer
    add_index :events, :company_id
  end
end
