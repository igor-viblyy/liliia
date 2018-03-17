# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  category_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  author_id          :integer
#

class Blog < ApplicationRecord
  extend FriendlyId

  has_attached_file :image, styles: { medium: '300x300>', thumb: "100x100>", blog: "294x190>" }, convert_options: { medium: "-quality 60 -interlace Plane", blog: "-quality 60 -interlace Plane" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :author

  validates :title, :body, presence: true

  scope :top_blog, ->(date) { where("created_at < ?", date).order(created_at: :desc).limit(4) }
  scope :all_blogs, -> { order(created_at: :desc) }

  friendly_id :title, use: :scoped, scope: :author
end
