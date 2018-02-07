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

  has_attached_file :image, styles: { medium: '300x300>', blog: "295x191>", thumb: "100x100>" }, convert_options: { medium: "-quality 60 -interlace Plane", blog: "-quality 60 -interlace Plane" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :company

  scope :index_event, -> { where(published: true).limit(4) }
  default_scope { order(created_at: :desc) }

  validates :title, :body, presence: true

  friendly_id :title, use: :scoped, scope: :company
end
