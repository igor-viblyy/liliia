class AddAdvertisingPagesColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisings, :page_event, :boolean
    add_column :advertisings, :page_blog, :boolean
  end
end
