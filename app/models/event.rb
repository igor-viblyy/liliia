# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  published          :boolean
#  date               :datetime
#  company_id         :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  has_attached_file :image, styles: { medium: '300x300>', thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :company

  scope :index_event, -> { where(published: true).limit(5) }
  default_scope { order(created_at: :desc) }

  validates :title, :body, presence: true
end
