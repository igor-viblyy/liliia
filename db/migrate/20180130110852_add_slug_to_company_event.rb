class AddSlugToCompanyEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :slug, :string
    add_column :events, :slug, :string
    add_index :companies, :slug
    add_index :events, :slug
  end
end
