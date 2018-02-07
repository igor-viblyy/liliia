# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Image < ApplicationRecord
  has_attached_file :image, styles: { medium: '300x300>', thumb: "100x100>" }, convert_options: { medium: "-quality 60 -interlace Plane" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # do_not_validate_attachment_file_type :image
end
