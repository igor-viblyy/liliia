class AddToAdvertBigPosition < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisings, :top_big, :boolean
  end
end
