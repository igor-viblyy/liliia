# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  extend FriendlyId

  has_many :articles, dependent: :destroy
  has_many :blogs, dependent: :destroy

  validates :name, presence: true

  friendly_id :name, use: :history

end
