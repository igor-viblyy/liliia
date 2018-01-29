class AddSlugToBlogAndAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :slug, :string
    add_column :authors, :slug, :string
    add_index :blogs, :slug
    add_index :authors, :slug
  end
end
