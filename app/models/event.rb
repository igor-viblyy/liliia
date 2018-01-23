# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  scope :index_event, ->(date) { where("created_at < ?", date).limit(10) }
end
