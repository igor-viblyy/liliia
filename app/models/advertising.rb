# == Schema Information
#
# Table name: advertisings
#
#  id                 :integer          not null, primary key
#  title              :string
#  url                :string
#  position_right     :boolean
#  position_top       :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  top_big            :boolean
#  page_event         :boolean
#  page_blog          :boolean
#  page_article       :boolean
#

class Advertising < ApplicationRecord
  has_attached_file :image, styles: { medium: '300x300>',  thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true

  scope :right, -> { where(position_right: true).limit(3) }
  scope :top, -> { where(position_top: true).limit(1) }
  scope :big, -> { where(top_big: true).limit(1) }
  scope :page_event, -> { where(page_event: true).limit(3) }
  scope :page_blog, -> { where(page_blog: true).limit(3) }
  scope :page_article, -> { where(page_article: true).limit(3) }
end
