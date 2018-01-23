# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  link         :string
#  title        :string
#  published_at :datetime
#  likes        :integer
#  dislikes     :integer
#  uid          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Video < ApplicationRecord
   YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

   validates :link, presence: true, format: YT_LINK_FORMAT

   scope :top, ->(date) { where("published_at < ?", date).limit(3) }
end
