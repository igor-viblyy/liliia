# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  extend FriendlyId
  has_many :events, dependent: :destroy

  friendly_id :name, use: :history
end
