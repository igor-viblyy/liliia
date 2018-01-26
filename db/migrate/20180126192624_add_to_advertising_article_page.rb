class AddToAdvertisingArticlePage < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisings, :page_article, :boolean
  end
end
