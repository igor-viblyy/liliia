# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ApplicationRecord
  belongs_to :category

  validates :title, :body, presence: true
end
