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
#  slug               :string           not null
#

class Article < ApplicationRecord
  extend FriendlyId
  # friendly_id :slug_candidates

  has_attached_file :image, styles: { medium: '300x300>', thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :category

  validates :title, :body, presence: true

  scope :top_article, -> { order(created_at: :desc).limit(10) }
  scope :interesting, -> { where(interesting: true) }

  default_scope { order(created_at: :desc) }

  # friendly_id :title, use: [:slugged, :history]
  friendly_id :title, use: :scoped, scope: :category

end
