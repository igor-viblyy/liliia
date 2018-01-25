# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  published  :boolean
#  date       :datetime
#

class Event < ApplicationRecord
  scope :index_event, -> { where(published: true).limit(5) }
end
