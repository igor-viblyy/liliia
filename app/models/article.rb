# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  category_id        :integer
#  interesting        :boolean
#

class Article < ApplicationRecord
  has_attached_file :image, styles: { medium: '300x300>', thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :category

  validates :title, :body, presence: true

  scope :top_article, ->(time) { where("updated_at < ?", time).limit(10) }
  scope :interesting, -> { where(interesting: true) }
end
