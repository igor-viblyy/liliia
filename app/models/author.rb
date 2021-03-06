# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord
  extend FriendlyId

  has_many :blogs, dependent: :destroy
  default_scope { order(created_at: :desc) }

  friendly_id :name, use: :history
end
