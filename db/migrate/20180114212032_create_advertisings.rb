class CreateAdvertisings < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisings do |t|
      t.string :title
      t.string :url
      t.boolean :position_right
      t.boolean :position_top

      t.timestamps
    end
  end
end
