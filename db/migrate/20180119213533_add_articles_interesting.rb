class AddArticlesInteresting < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :interesting, :boolean
  end
end
