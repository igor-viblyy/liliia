class AddAttachmentImageToAdvertisings < ActiveRecord::Migration[5.1]
  def self.up
    change_table :advertisings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :advertisings, :image
  end
end
