# == Schema Information
#
# Table name: store_sections
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StoreSection < ApplicationRecord
  has_many :products

  validates :name, presence: true, format: { with: /\A[\w\s]{1,64}\z/ }
end
